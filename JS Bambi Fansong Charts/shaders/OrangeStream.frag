// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel
// og shader: https://www.shadertoy.com/view/WdsfD8

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;

// end of ShadertoyToFlixel header

#define F(a,n)a=abs(a)-n,a=vec2(a.x*.5+a.y,a.x-a.y*.5)
void mainImage(out vec4 O, vec2 C) {
    O=vec4(0);
	for(float g,e,i;i++<70.;){
   		vec3 p=g*vec3((C*2.-iResolution.xy)/iResolution.y,1);
        p.z+=iTime;
        p=fract(p)-.5;
        for(int j=0;j++<8;)
            F(p.zy,.0),
            F(p.xz,.55);
        g+=e=.4*length(p.yz)-2e-3;
        e<.01?O+=vec4(.7,.2,.05,1)/i:O;
    }
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}