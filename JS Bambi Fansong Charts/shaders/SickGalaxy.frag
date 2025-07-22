// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

// https://www.shadertoy.com/view/M3Bczz

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header


#define iterations 10
#define formuparam 0.53

#define volsteps 20
#define stepsize 0.1

#define zoom   0.800
#define tile   0.850
#define speed  0.000 

#define brightness 0.001
#define darkmatter 0.600
#define distfading 0.730
#define saturation 0.800

#define time iTime
#define resolution iResolution.xy
void mainVR( out vec4 fragColor, in vec2 fragCoord, in vec3 ro, in vec3 rd )
{
	//get coords and direction
	vec3 dir=rd;
	vec3 from=ro;
	
	//volumetric rendering
	float s=0.1,fade=1.;
	vec3 v=vec3(0.);
	for (int r=0; r<volsteps; r++) {
		vec3 p=from+s*dir*.5;
		p = abs(vec3(tile)-mod(p,vec3(tile*2.))); // tiling fold
		float pa,a=pa=0.;
		for (int i=0; i<iterations; i++) { 
			p=abs(p)/dot(p,p)-formuparam;
            p.xy*=mat2(cos(iTime*0.01),sin(iTime*0.01),-sin(iTime*0.01),cos(iTime*0.01));// the magic formula
			a+=abs(length(p)-pa); // absolute sum of average change
			pa=length(p);
		}
		float dm=max(0.,darkmatter-a*a*.001); //dark matter
		a*=a*a; // add contrast
		if (r>6) fade*=1.23-dm; // dark matter, don't render near
		//v+=vec3(dm,dm*.5,0.);
		v+=fade;
		v+=vec3(s,s*s,s*s*s*s)*a*brightness*fade; // coloring based on distance
		fade*=distfading; // distance fading
		s+=stepsize;
	}
	v=mix(vec3(length(v)),v,saturation); //color adjust
	fragColor = vec4(v*.02, texture(iChannel0, fragCoord / iResolution.xy).a);	
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	//get coords and direction
	vec2 uv=fragCoord.xy/iResolution.xy-.5;
	uv.y*=iResolution.y/iResolution.x;
	vec3 dir=vec3(uv*zoom,1.);

vec2 uPos = ( gl_FragCoord.xy / resolution.y );//normalize wrt y axis
	uPos -= vec2((resolution.x/resolution.y)/2.0, 0.5);//shift origin to center
	
	float multiplier = 0.0005; // Grosseur
	const float step = 0.006; //segmentation
	const float loop = 80.0; //Longueur
	const float timeSCale = 0.5; // Vitesse
	
	vec3 blueGodColor = vec3(0.0);
	for(float i=1.0;i<loop;i++){		
		float t = time*0.02*timeSCale-step*i*i;
		vec2 point = vec2(0.75*sin(t), 0.5*sin(t));
		point += vec2(0.75*cos(t*4.0), 0.5*sin(t*3.0));
		point /= 11. * sin(i);
		float componentColor= multiplier/((uPos.x-point.x)*(uPos.x-point.x) + (uPos.y-point.y)*(uPos.y-point.y))/i;
		blueGodColor += vec3(componentColor/4.0, componentColor/4.0, componentColor);
	}
	
	
	vec3 color = vec3(0,0,1);
	color += pow(blueGodColor,vec3(0.2,0.9,0.4));
	//mouse rotation
	vec4 o = fragColor;
    vec2 F =fragCoord;
 vec2 R = iResolution.xy; 
    o-=o;
    for(float d,t = iTime*.01, i = 0. ; i > -1.; i -= .06 )          	
    {   d = fract( i -3.*t );                                          	
        vec4 c = vec4( ( F - R *.5 ) / R.y *d ,i,0 ) * 28.;            	
        for (int j=0 ; j++ <27; )                                      	
            c.xzyw = abs( c / dot(c,c)                                 	
                    -vec4( 7.-.2*sin(t) , 6.3 , .7 , 1.-cos(t/.8))/7.);	
       o -= c * c.yzww  * d--*d  / vec4(3,5,1,1)*0.2;                 
    }

	vec3 from=vec3(1.,.5,0.5)*o.xyz;

	float intensity = 0.7; // Bright effect
	vec2 offset = vec2(0 , 0); // x / y offset
	vec3 light_color = vec3(0.3, 0.5, 0.5); // RGB, proportional values, higher increases intensity
	float master_scale = 0.2 + 0.02*sin(time); // Change the size of the effect
	float c = pow(master_scale/(length(uv+offset)), -0.1*sin(time) + intensity);
	
	mainVR(fragColor, fragCoord, from, dir);	
    fragColor*=vec4(color+c*vec3(0.4,.5, 0.5), 1.0);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}