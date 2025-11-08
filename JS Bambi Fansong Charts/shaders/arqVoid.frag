// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;

// end of ShadertoyToFlixel header

// 240 chars by Xor (with aspect ratio fix)
// https://www.shadertoy.com/view/NscXR8
void mainImage(out vec4 O, vec2 I)
{
    vec3 p=iResolution,d = -.5*vec3(I+I-p.xy,p)/p.x,c = d-d, i=c;
    for(;i.x<1.;c += length(sin(p.yx)+cos(p.xz+iTime))*d)
        p = c,
        p.z -= iTime+(i.x+=.01),
        p.xy *= mat2(sin((p.z*=.1)+vec4(0,11,33,0)));
    O = vec4(10,0,2.5,9)/length(c);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}