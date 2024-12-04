// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;
#define texture flixel_texture2D

// third argument fix
vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
	vec4 color = texture2D(bitmap, coord, bias);
	if (!hasTransform)
	{
		return color;
	}
	if (color.a == 0.0)
	{
		return vec4(0.0, 0.0, 0.0, 0.0);
	}
	if (!hasColorTransform)
	{
		return color * openfl_Alphav;
	}
	color = vec4(color.rgb / color.a, color.a);
	mat4 colorMultiplier = mat4(0);
	colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
	colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
	colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
	colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
	color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
	if (color.a > 0.0)
	{
		return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
	}
	return vec4(0.0, 0.0, 0.0, 0.0);
}

// variables which is empty, they need just to avoid crashing shader
uniform float iTimeDelta;
uniform float iFrameRate;
uniform int iFrame;
#define iChannelTime float[4](iTime, 0., 0., 0.)
#define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
uniform vec4 iMouse;
uniform vec4 iDate;

float polygonDistance(vec2 p, float radius, float angleOffset, int sideCount) {
	float a = atan(p.x, p.y)+ angleOffset;
	float b = 6.28319 / float(sideCount);
	return cos(floor(.5 + a / b) * b - a) * length(p) - radius;
}

// from https://www.shadertoy.com/view/4djSRW
#define HASHSCALE1 443.8975
float hash11(float p) // assumes p in ~0-1 range
{
	vec3 p3  = fract(vec3(p) * HASHSCALE1);
    p3 += dot(p3, p3.yzx + 19.19);
    return fract((p3.x + p3.y) * p3.z);
}

#define HASHSCALE3 vec3(.1031, .1030, .0973)
vec2 hash21(float p) // assumes p in larger integer range
{
	vec3 p3 = fract(vec3(p) * HASHSCALE3);
	p3 += dot(p3, p3.yzx + 19.19);
	return fract(vec2((p3.x + p3.y)*p3.z, (p3.x+p3.z)*p3.y));
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = vec2(0.5) - (fragCoord.xy / iResolution.xy);
    uv.x *= iResolution.x / iResolution.y;
    
    float accum = 0.;
    for(int i = 0; i < 83; i++) {
        float fi = float(i);
        float thisYOffset = mod(hash11(fi * 0.017) * (iTime + 19.) * 0.2, 4.0) - 2.0;
        vec2 center = (hash21(fi) * 2. - 1.) * vec2(1.1, 1.0) - vec2(0.0, thisYOffset);
        float radius = 0.5;
        vec2 offset = uv - center;
        float twistFactor = (hash11(fi * 0.0347) * 2. - 1.) * 1.9;
        float rotation = 0.1 + iTime * 0.2 + sin(iTime * 0.1) * 0.9 + (length(offset) / radius) * twistFactor;
        accum += pow(smoothstep(radius, 0.0, polygonDistance(uv - center, 0.1 + hash11(fi * 2.3) * 0.2, rotation, 5) + 0.1), 3.0);
    }
    
    vec3 subColor = vec3(0.4, 0.8, 0.2); //vec3(0.4, 0.2, 0.8);
    vec3 addColor = vec3(0.3, 0.2, 0.1);//vec3(0.3, 0.1, 0.2);
    
	fragColor = vec4(vec3(1.0) - accum * subColor + addColor, texture(iChannel0, uv).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}