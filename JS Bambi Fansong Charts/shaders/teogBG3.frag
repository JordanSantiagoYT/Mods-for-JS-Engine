// og shader: https://www.shadertoy.com/view/4l2yWW
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

vec4 noise(vec4 v){
    // ensure reasonable range
    v = fract(v) + fract(v*1e4) + fract(v*1e-4);
    // seed
    v += vec4(0.12345, 0.6789, 0.314159, 0.271828);
    // more iterations => more random
    v = fract(v*dot(v, v)*123.456);
    v = fract(v*dot(v, v)*123.456);
    v = fract(v*dot(v, v)*123.456);
    return v;
}

vec4 smooth_noise(vec4 v){
    vec4 iv = floor(v);
    vec4 u = v - iv;
    
    //u = u*u*(3.0 - 2.0*u);
    
    vec4 n0 = noise(iv + vec4(0, 0, 0, 0));
    vec4 n1 = noise(iv + vec4(1, 0, 0, 0));
    vec4 n2 = noise(iv + vec4(0, 1, 0, 0));
    vec4 n3 = noise(iv + vec4(1, 1, 0, 0));
    
    vec4 n4 = noise(iv + vec4(0, 0, 1, 0));
    vec4 n5 = noise(iv + vec4(1, 0, 1, 0));
    vec4 n6 = noise(iv + vec4(0, 1, 1, 0));
    vec4 n7 = noise(iv + vec4(1, 1, 1, 0));
    
    vec4 n8 = noise(iv + vec4(0, 0, 0, 1));
    vec4 n9 = noise(iv + vec4(1, 0, 0, 1));
    vec4 na = noise(iv + vec4(0, 1, 0, 1));
    vec4 nb = noise(iv + vec4(1, 1, 0, 1));
    
    vec4 nc = noise(iv + vec4(0, 0, 1, 1));
    vec4 nd = noise(iv + vec4(1, 0, 1, 1));
    vec4 ne = noise(iv + vec4(0, 1, 1, 1));
    vec4 nf = noise(iv + vec4(1, 1, 1, 1));
    
    vec4 n01 = mix(n0, n1, u.x);
    vec4 n23 = mix(n2, n3, u.x);
    vec4 n45 = mix(n4, n5, u.x);
    vec4 n67 = mix(n6, n7, u.x);
    vec4 n89 = mix(n8, n9, u.x);
    vec4 nab = mix(na, nb, u.x);
    vec4 ncd = mix(nc, nd, u.x);
    vec4 nef = mix(ne, nf, u.x);
    
    vec4 n0123 = mix(n01, n23, u.y);
    vec4 n4567 = mix(n45, n67, u.y);
    vec4 n89ab = mix(n89, nab, u.y);
    vec4 ncdef = mix(ncd, nef, u.y);
    
    vec4 n01234567 = mix(n0123, n4567, u.z);
    vec4 n89abcdef = mix(n89ab, ncdef, u.z);
    
    vec4 n = mix(n01234567, n89abcdef, u.w);
    
    return n;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord){
	vec2 uv = fragCoord.xy / iResolution.xy*2.0 - 1.0;
    uv.x *= iResolution.x/iResolution.y;
    if (uv.x < 0.0) uv.x = -uv.x;
    
    float angle = atan(uv.y, uv.x);
    
    uv = vec2(angle, length(uv));
    
    vec4 result = vec4(0);
    const float n = 10.0;
    
    for (float i = 0.0; i < n; i++){
        vec4 r = smooth_noise(vec4(i, uv*20.0, iTime));
        
        vec2 offset = r.xy*2.0 - 1.0;
        
        offset *= r.z*0.02 + 0.05;
        
        float x = uv.x + offset.x;
        float y = uv.y + offset.y;

        float f = fract(x*5.0 + i/n);
        f -= 0.5;
        float u = 0.5;
        float spikyness = mix(10.0, 100.0, uv.y);
        f = exp(-spikyness*f*f);
        
		f = smoothstep(y, y + 0.1, f);
        if (uv.y > 1.0) f = 1.0;
        
        vec4 color = texture(iChannel0, vec2(x, y));
        
        result = mix(result, color, f);
    }
    
    result *= vec4(0.7, 0.7, 0.7, 0.7);
    
    fragColor = result;
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}