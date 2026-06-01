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

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec2 adjustedUV = (uv - 0.5) * 3.5;
    float timeFactor = iTime * 0.025;
    vec4 outputColor = vec4(0.0);
    float x;
    for (float waveIndex = 0.0; waveIndex < 25.0; waveIndex += 1.0) {
        vec2 waveVector = vec2(cos(x = waveIndex * 15. - timeFactor), sin(x));
        float wave = sin(waveIndex * mix(0.05, 0.5, sin(timeFactor) * 0.5) - timeFactor);
        float distance = length(adjustedUV - wave * waveVector); 
        vec3 color;
        for(int i=0;i<3;i++) {
            float z = waveIndex * 0.000009;
            float l = distance;
            vec2 uv = adjustedUV;
            uv += waveVector/l*(sin(z)+5.)*abs(sin(l*1.1-z-z));
            color[i] = 0.0013/length(mod(uv + vec2(0.003 * float(i-1)),1.1)-0.5); 
        }
        color *= vec3(1.00, 1.00, 1.0); 
        outputColor += vec4(color / distance, 2.0);
    }
    fragColor = outputColor;
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}