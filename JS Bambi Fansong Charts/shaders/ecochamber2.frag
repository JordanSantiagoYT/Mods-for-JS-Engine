// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;

// end of ShadertoyToFlixel header

// [SH17A] Starfall / minimal KaliSet by unbird
// Someone complained about the load of comments, so here's another switch.
// Bare minimum first, so it fits into the page's view.
// /*  <- uncomment to switch to commented version further below


// "canonical" loop: change step size for fidelity and performance
#define F for(float i = .1; i <.9; i+=.04)
void mainImage( out vec4 f, in vec2 u )
{	
    u /= iResolution.y;
    f -= f;    
    F 
    {
        // vec2 on the next line defines direction and speed of the animation
        vec3 p = vec3(u + (iTime/i - i)/vec2(30,10), i);
		            	
        p = abs(1.-mod(p, 2.));
        float a = length(p),
              b,
              c = 0.;
        F
          p = abs(p)/a/a - .57,   // <- Kali magic constant (between .5 .. .6 gives good results)
          b = length(p),
          c += abs(a-b),
          a = b;        
        
        c*=c;
                
        f += c*vec4(0.3, 0.3, 0.3, 0.3) / 3e4 ; // <- overall scaling constant, play here if you're "blind"
    }	
}

// - Thanks to Bananaft for the comma trick in the inner loop.
// - Cleaned a bit and commented the knobs for deadline (only short version above)


// careful: switch comment, don't touch
/*/
// careful: switch comment, don't touch

///////////////////////////////////////////////////////////////////////////////////////////////////
// 
// [SH17A] Starfall / minimal KaliSet
// Shadertoy 2017 Competition contribution
// by unbird
// July 2017
// License : Use at your own risk, do whatever you want, gimme the least headache license 1.0.
//
// Original used: 
// Magic Fractal by dgreensp 
// https://www.shadertoy.com/view/4ljGDd
// I would like to thank dgreensp for this pearl.
// It's a bare Kaliset variant, has little fluff, so I chose this to work from.
// He didn't put a license, so I hope it's ok.
// 
// I left the original comments somewhat, marked as //--
// 
// 
// Goal: 
// Meteorite/Shooting star storm animation 
// 1Get it down to reach the 280 character limit (competition rule round 1)
// Mostly code jugglery, renaming, inlining etc. so far
// I now got it down, though saving more space would let me play with polishing/effects.
// 
//
// Current problems:
// - Delicate. No convincing central knob (and too many) or even autoexposure. 
//   Missing the spot means black or white.
// - Potentian platform problems. Not yet run on different hardware/compilers, need feedback.
//   Here NVidia GTX 960.
// - Still too big... Nope, as of now at 280... Hooray. But it looks boring.
//   The pow accentuation was better, but maybe one can fake something else.
// - Minor: Initial looks regular, needs about 15 sec to disperse the planes.
//          I can't use offsets now.
// - It's messy, but hey.
// 
// 
// Reference: Technical/math read about Kaliset : http://casual-effects.blogspot.ch/2013/08/starfield-shader.html
//            
// History:
// 2017-07-15 Created. Brought down to 320 chars.
// 2017-07-16 Cleanup, somments, further reductions. 302 chars.
//            Oh. Wow I have 280 chars!!!


  // <- put switch comment start here (/*) for sompetition vs older, more convenient code later

// Attempt at a "canonical" loop. Idea: provides approx. unit range (without surprises). 
// Loop count/resolution controlled through stepsize (last constant). I nest then two of them.
// 
// Also performance control. Increase step size if it runs too slow for you.
#define F for(float i = .1; i <.9; i+=0.04){

void mainImage( out vec4 f, in vec2 u )
{	
    u = u.xy / iResolution.yy;
    
    //uv.x = (uv.x - 1.0)*(1.0 + uv.y*uv.y * 0.4) + 1.0;
    //--scroll a certain number of screenfuls/second
    //uv.y += iTime*vec2(-0.1,0.05);
    
    // Clear. 
    f *= 0.;
    
    // I'd like to add background (planet/atmosphere) but I got no place yet.
 

    // Here I eliminated a 3D rotation. "Expensive" source code wise,
    // Doesn't seem to be needed. Problem: Takes some time to 
    // "mix the planes" at the start.
    //vec3 p = 0.5*M*vec3(uv, z);


    // No longer needed, time is used only once, so inlined
    // float t = .1 * iTime;
    
    
    // outer/planes loop
    //for(float i = 0.1; i <= 0.9; i+= 0.05)
      F  
    //{
        // 
        //
        // scaling the planes, including "perspective" (/i)  
        vec3 p = vec3(u + (.1 * iTime/i - i) * vec2(.4,.5), 0
                          //sin(t*.4)*.2  // <- wobbling z gives the stars some "burning". Too costly for now
                          );
        
        // abs is enough
        //p = 1. - abs(1. - mod(p, 2.));
    	p = abs(1.-mod(p, 2.));

        float a = length(p),
              b = a,
              c = 0.;
        //--This is the fractal.  More iterations gives a more detailed
        //--fractal at the expense of more computation.
        F
        //{
          //--The number subtracted here is a "magic" paremeter that
          //--produces rather different fractals for different values.
            
		  // The magic number below (the constant) controls the overall shape. 
          // Again somewhat delicate: Viable values aroung 0.5..0.6. 
          // Annoyingly, those two numbers 
          p = abs(p)/(a*a) - .57;    
          b = length(p);
          c += abs(a-b);
          a = b;
    
          // tricky problem: can I remove a variable here ? it's all interlocked it seems.
              
        }
        
        // Nope, if I clamp the thing is gone, and I somehow need pow though to accentuate.
		// I need stats to normalize this :P
        //v = clamp(v, 0., 1.);
        
		// Accentuate. Disable for now, too costly.
		//c = pow(c, 5.);
		// If you enable this, choose 4e-4 for the later constant
        //c*=c;

        f.rgb +=                   
                 // Color. This sort of gives a fiery fireball storm.
                 // Not what I'm after, but it's a start.
                 vec3(c, .5*c, i * c) 
                 // Here's currently the "central" knob, a scale constant. Play here if you're blind.
                 // division saves 1 char
                 / 4e2;
             	 
    }
	
}

// careful: switch comment, don't touch
/*
// careful: switch comment, don't touch

///////////////////////////////////////////////////////////////////////////////////////////////////
// working, older variant.


float finish (float x)
{
    x *= 0.3;
    x = pow(x, 5.0);
    //result = pow(result, 5.);
    //result -= 0.5;
    return x-10.0;
}

float m(vec3 p) {
    // The fractal lives in a 1x1x1 box with mirrors on all sides.
    // Take p anywhere in space and calculate the corresponding position
    // inside the box, 0<(x,y,z)<1
    p = 1. - abs(1. - mod(p, 2.));
    
    float r = length(p),
          s = r,
          t = 0.0;
    // This is the fractal.  More iterations gives a more detailed
    // fractal at the expense of more computation.
    for (int i=0; i < 12; i++) {
      // The number subtracted here is a "magic" paremeter that
      // produces rather different fractals for different values.
      p = abs(p)/(r*r) - 0.57;
      s = length(p);
      t += abs(s-r);
      r = s;
    }

    return t;
}

void mainImage( out vec4 f, in vec2 u )
{
	//vec2 u = fragCoord.xy / iResolution.yy;
    u = u.xy / iResolution.yy;
    
    //uv.x = (uv.x - 1.0)*(1.0 + uv.y*uv.y * 0.4) + 1.0;
    // scroll a certain number of screenfuls/second
    //uv.y += iTime*vec2(-0.1,0.05);
    
    
    float t = 0.1 * iTime;
    float z = t*0.01;
    z = sin(t*0.4)*0.2;
	f *= 0.;
    // Rotate uv onto the random axes given by M, and scale
    // it down a bit so we aren't looking at the entire
    // 1x1x1 fractal volume.  Making the coefficient smaller
    // "zooms in", which may reduce large-scale repetition
    // but requires more fractal iterations to get the same
    // level of detail.
    
    //vec3 p = 0.5*M*vec3(uv, z);
    
    
    for(float i = 0.1; i <= 0.9; i+= 0.05)
    {
        vec2 xy = u + i * vec2(11.,-26.);
        xy.xy += t*0.05/i;        
        vec3 p = 0.5*vec3(xy, z);
        
        p *= 1.1;
        p.yz += 2.;        
        
        float v = m(p);
        v = pow(v, 3.0);        
        f.rgb += 0.00001 * v * mix(vec3(1.,1.,.8), vec3(.3, .1, .2), i);
    }
        
     
	
}
/* */

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}