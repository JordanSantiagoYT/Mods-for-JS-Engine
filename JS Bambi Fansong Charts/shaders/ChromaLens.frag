// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel
// https://www.shadertoy.com/view/4ttXWM

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

// based on Pseudo Fish Eye Effect by jt
// https://www.shadertoy.com/view/MtcXDH

float distortion = 0.2;			// the bias of the barrel distortion
const float iterations = 10.0;	// how many samples to use for edge blur
float strength = 0.01;			// how much edge blur is applied (to obscure the r, g, b separation)
float separation = 0.1;			// how much to separate the r, g and b

vec4 Aberrate (sampler2D source, vec2 uv, float amount) {
 
    return texture(source, 0.5 + uv / sqrt(1.0 + amount * dot(uv, uv)));
}


void mainImage(out vec4 pixel, vec2 uv)
{
	uv = uv / iResolution.xy - 0.5;
    
    vec4 A = vec4(0, 0, 0, 1);
    
    for (float i = -iterations; i < iterations; i++)
    {
	   	A.r += Aberrate(iChannel0, uv, i * strength + (distortion + separation)).r;
    }
    
    for (float i = -iterations; i < iterations; i++)
    {
	   	A.g += Aberrate(iChannel0, uv, i * strength + distortion).g;
    }
    
    for (float i = -iterations; i < iterations; i++)
    {
	   	A.b += Aberrate(iChannel0, uv, i * strength + (distortion - separation)).b;
    }
    
    A /= iterations * 2.0;
    
    pixel = A;    
}


void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}