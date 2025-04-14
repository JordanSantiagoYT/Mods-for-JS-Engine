// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

//original shader: https://www.shadertoy.com/view/NdcBR8

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// variables which are empty, they need just to avoid crashing shader
uniform vec4 iMouse;

// end of ShadertoyToFlixel header

// Effect based on combination  of periodic functions
// weighted with asymptotically decreasing coefficients.

//directive for NVidia compilers
//#pragma optionNV (unroll all)


//Parameters
#define SPEED 0.1



vec3 Effect(float speed, vec2 uv, float time)
{

    float t = mod(time*speed,60.0);
    float rt =0.01*sin(t*0.45);
   
    mat2 m1 = mat2(cos(rt),-sin(rt),-sin(rt),cos(rt));
    vec2 uva=uv*m1;
    float irt = 0.005* cos(t*0.05);
    mat2 m2 = mat2(sin(irt),cos(irt),-cos(irt),sin(irt));
	for(int i=1;i<40;i+=1)
	{	
		float it = float(i);
        uva*=(m2);
        uva.y+=-1.0+(0.6/it) * cos(t + it*uva.x + 0.5*it)
            *float(mod(it,2.0)==0.0);
		uva.x+=1.0+(0.5/it) * cos(t + it*uva.y + 0.5*(it+15.0));
      
        
	}
    //Intensity range from 0 to n;
    float n = 0.5;
    float r = n + n * sin(4.0*uva.x+t);
    float gb = n + n * sin(3.0*uva.y);
	return vec3(gb*0.8*r,r*1.3,gb*r)*0.15;
}	

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    float t = iTime;
    vec2 mouse = iMouse.xy/iResolution.xy;
    mouse = 2.0 * mouse - 1.0;
    mouse.x *= iResolution.x/iResolution.y;
    
    vec2 uv = fragCoord/iResolution.xy;
    uv = 2.0 * uv - 1.0;
    uv.x *= iResolution.x/iResolution.y;
      
    uv *= (0.9 + 0.1*sin(t*0.01));
    uv.y-=iTime*0.13;
  
	vec3 col = Effect(SPEED,uv,t);
    col+= Effect(SPEED,uv*3.0,2.0*t+10.0)*0.3;
    col+= Effect(SPEED,sin(iTime*0.01)*uv*2.0,2.0*t+10.0)*0.1;

	fragColor = vec4(col, texture(iChannel0, fragCoord / iResolution.xy).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}