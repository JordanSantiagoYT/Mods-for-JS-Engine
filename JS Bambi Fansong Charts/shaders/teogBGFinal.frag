//original shader: https://www.shadertoy.com/view/fsl3R2
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

//enable gpu extension so that the game doesnt shit itself
#extension GL_EXT_gpu_shader4 : enable

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

#define PI acos(-1.)

// -------------------------------------- //
// Animation
#define ANIM

// inner/outer Radius of iris
#define INNER_R (0.25+sin(iTime*PI*0.5)*0.06125)
#define OUTER_R .875

// Background, background of the iris, inner and outer color of eye
#define BG     vec3(0.0, 0.0, 0.0 )
#define EYE_BG vec3(0.15, 0.05,0.1)
#define EYE_1  vec3(0.3, 0.0,0.0)
#define EYE_2  vec3(1.3,0.3,0.3 )

// how many layers of "strings" are rendered
#define LAYERS 4
// -------------------------------------- //

// Antialiasing
#define EPS 12. / iResolution.y / length(p) // epsilon for antialiasing

// gamma correction
#define G(a) pow((a), vec3(0.4545))
#define IG(a) pow((a), vec3(2.2))

// hash functions by Dave_Hoskins - https://www.shadertoy.com/view/XdGfRR
#define UI0 1597334673U
#define UI1 3812015801U
#define UI2 uvec2(UI0, UI1)
#define UI3 uvec3(UI0, UI1, 2798796415U)
#define UIF (1.0 / float(0xffffffffU))

float hash11(in float p) {uvec2 n = uint(int(p)) * UI2;uint q = (n.x ^ n.y) * UI0;return float(q) * UIF;}

vec2 hash22(in vec2 p) {uvec2 q = uvec2(ivec2(p))*UI2;q = (q.x ^ q.y) * UI2;return vec2(q) * UIF;}

// simplex noise by iq - https://www.shadertoy.com/view/Msf3WH
float noise(in vec2 p) {
    const float K1 = 0.366025404,K2 = 0.211324865;vec2 i=floor(p+(p.x+p.y)*K1),a=p-i+(i.x+i.y)*K2;float m=step(a.y,a.x);vec2 o=vec2(m,1.-m);
    vec2 b=a-o+K2,c=a-1.+2.*K2;vec3 h=max(0.5-vec3(dot(a,a),dot(b,b),dot(c,c)),0.),n=h*h*h*h*vec3(dot(a,hash22(i+0.0)),dot(b,hash22(i+o)),dot(c,hash22(i+1.)));
    return dot(n,vec3(70.0));
}

mat2 rot(in float a) {
    float s = sin(a), c = cos(a);
    return mat2(c,-s,s,c);
}

float iris(in vec2 p) {
    float d = (OUTER_R + INNER_R) * 0.5;
    d = (abs(length(p) - d) - d + INNER_R) / (d - INNER_R); // normalized distance to the radii
    mat2 r;                        // animated rotation of noise-domain
    float s,                       // animated scale of noise-domain
          a = atan(p.y, p.x),      // angle to center
          na,                      // offset of the angle (determined by 2d-noise)
          f = exp2(float(LAYERS)), // scale of the layers
          pattern,                 // output variable
          n,                       // value of the "strings" (determined by looping 1d-noise)
          t,                       // added thickness to "strings"
          alpha;                   // maybe not alpha but I don't know how else to call it
    vec2 m = iMouse.xy/iResolution.y; // mouse offset of noise-domain

    #ifdef ANIM
    s = sin(iTime * PI * 0.25) * 0.25;    // animated scale of domain
    r = rot(iTime * PI * 0.0078125);      // animated rotation of domain
    #endif
    
    for (int i=0; i<LAYERS; i++) {
        na = a + noise((p - m/f) * 1.5 * f * (1. + s / f) * r) * length(p) * 0.5 / f; // noise to warp strings
        n = noise(vec2(sin(na),cos(na)) * 2. * f);                                    // value of strings
        
        
        t = .75 / f ;                                     // thickness/density of strings
        t += - 1.5 * smoothstep(1.0, 0.0, d + 0.5) + 1.5; // strings are cut off at the edge of the iris
        t += -.125 * smoothstep(1.0, 0.0, d + 1.);        // strings are thicker when closer to center radius
        
        pattern -= smoothstep(-0.35,  0.25,  n - t) * 0.5 * pattern; // "shadows" of the "strings"
        alpha =    smoothstep(-EPS*f, EPS*f, n - t);
        pattern += pow(alpha, 2.) * (1. - pattern);               // addition of the layers (i don't really know what im doing here but it looks nice)
    
        f *= 0.5;
    }
    return max(0.0, pattern); // because of the shadows it could be negative so i clamp it here
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = openfl_TextureCoordv.xy;   //the game will shit itself if this isnt defined lmao
    vec2 p = (2. * fragCoord - iResolution.xy) / iResolution.y;
    
    float irisPerimiter_mask = smoothstep(0.1,  -0.1,  length(p) - OUTER_R);
    float irisPupil_mask =     smoothstep(0.05, -0.05, length(p) - INNER_R);
    float iris_mask =          -irisPupil_mask + irisPerimiter_mask;
    
    float iris_pattern = iris(p);
    
    vec3 iris_color = IG(mix(G(EYE_1), G(EYE_2), vec3(sqrt(clamp((length(p) - INNER_R) / (OUTER_R - INNER_R) + 0.01, 0.0, 1.0))))); // color gradient (is this how you gamma correct?)
    
    vec3 col = iris_pattern * iris_color + EYE_BG * (1. - iris_pattern); // blending between the gradient and the background
    
    col = col * iris_mask + (1. - iris_mask) * BG;
    
    fragColor = vec4(col, texture(iChannel0, uv).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}