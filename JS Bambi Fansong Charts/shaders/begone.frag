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

float tr(vec2 pt)
{

    const float k = sqrt(3.0);
    pt.x = abs(pt.x) - 1.0;
    pt.y = pt.y + 1.0/k;
    if( pt.x+k*pt.y>0.0 ) 
        pt=vec2(pt.x-k*pt.y,-k*pt.x-pt.y)/2.0;
    pt.x -= clamp( pt.x, -2.0, 0.0 );
    return -length(pt)*sign(pt.y);
}

float three(vec2 p)
{
    p.y -= 0.26;
    p.x += 0.12;
    float norm = min(length(p) - 0.5, length(p- vec2(0, -0.6)) - 0.5);
    p-= vec2(-.5, 0);
    float diff = min(length(p) - 0.5, length(p- vec2(0, -0.6)) - 0.5);
    return max(-max(-diff, norm), max(-diff, norm));
}


float ss(vec3 p)
{
    float ang = iTime + p.z * 8.;
    
   // float ang = iTime + floor(p.z * 2.25 - .352622);
    
    p.xy *= mat2(cos(ang),-sin(ang), sin(ang),cos(ang));
    p.z = mod(p.z +3., 6.) -3.;
    float t = max(-tr(p.xy), tr(p.xy/1.5) *1.5);
    
    vec2 w = vec2(t, abs(p.z) -.25);
    float res = min(max(w.x, w.y),0.) + length(max(w,.0));
    
    return res -0.2;
}
vec2 rt(vec3 ro, vec3 rd, inout vec3 pp)
{
    float ll = 0., dd = 0., cc = 100.;
    
    for(int i = 0; i < 255;i ++)
    {
        pp = ro + rd * ll;
        dd = ss(pp);
        ll += dd;
        cc = min(dd, cc);
        if(dd < 0.02 || ll > 300.)
        break;
    }
     
    return vec2( dd, cc);
}

vec3 nn (vec3 p)
{
    vec3 n = vec3 (0);
    
    for(int i = min(iFrame, 0); i < 4; i++)
    {
        vec3 e = 0.5773* (2. * vec3((((i+3)>>1)&1), ((i>>1)&1),(i&1)) -1.);
        n += e* ss(p +e *0.001);
    }
    return normalize(n);
}
vec4 gc(vec3 ro, vec3 rd)
{
    vec3 p = vec3(ro);
    vec2 dc = rt(ro,rd, p);
    vec3 n = nn(p);
    vec3 col = vec3(0.8, 0.1, 1.);
    
    if(dc.x <0.01)
    {
        return vec4(max((n.b) * col, 0.),1.);
    }
    
    return vec4((1. + 0.23 * dc.y * dc.y) * col, 1.);
}
   

void mainImage(out vec4 c, in vec2 f)
{
    vec2 r = iResolution.xy, u = (2. *f  -r)/r.y;
    
    vec3 ro = vec3(0,0,-33.33/3. + iTime * 6.), rd = vec3(normalize(vec3(u,3. * 10.)));
    
    
    c = max(gc(ro,rd) * (length(u) -0.4), 0.) + step(three((u + texture(iChannel0, vec2(f/r + iTime * .01)).xy * 0.015 )/90.0) * 10.0,0.01) ;
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}