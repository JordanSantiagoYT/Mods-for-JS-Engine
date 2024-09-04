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

/*

    Transparent Cube Field
    ----------------------
	
	Obviously, this isn't what I'd consider genuine transparency, because there's no
	ray bending, and so forth. However, it attempts to give that feel whilst maintaining 
	framerate. I've tried to keep things simple and keep the code to a minimum. It needs 
	some God rays, but that'd just add to the complexity.

	The inspiration to do this came from a discussion with Fabrice Neyret, after viewing
	his various cube examples. He's a pretty clever guy, so he'll probably know how to do 
	this ten times faster with ten times more efficiency. :)

	It doesn't look much like it, but Duke's port of Las's "Cloudy Spikeball" also provided 
	inspiration.

	By the way, I deliberately made it blurry, and added more jitter than necessary in the
	pursuit of demo art. :) However, you can tweak the figures and dull down the jitter	to 
	produce a reasonably clean looking, transparent scene... of vacuum filled objects. :)

	// Related shaders:

	Crowded Cubes 2 - FabriceNeyret2
	https://www.shadertoy.com/view/ltBSRy

	Cloudy Spikeball - Duke
    https://www.shadertoy.com/view/MljXDw
    // Port from a demo by Las - Worth watching.
    // http://www.pouet.net/prod.php?which=56866
    // http://www.pouet.net/topic.php?which=7920&page=29&x=14&y=9

    // Here's a more interesting, cleaner version.
    Transparent Lattice - Shane
    https://www.shadertoy.com/view/Xd3SDs
	
*/


// Cheap vec3 to vec3 hash. Works well enough, but there are other ways.
vec3 hash33(vec3 p){ 
    
    float n = sin(dot(p, vec3(7, 157, 113)));    
    return fract(vec3(2097152, 262144, 32768)*n); 
}


float map(vec3 p){
    
	
	// Creating the repeat cubes, with slightly convex faces. Standard,
    // flat faced cubes don't capture the light quite as well.
   
    // Cube center offset, to create a bit of disorder, which breaks the
    // space up a little.
    vec3 o = hash33(floor(p))*.2; 
    
    // 3D space repetition.
    p = fract(p + o) - .5; 
    
    // A bit of roundness. Used to give the cube faces a touch of convexity.
    float r = dot(p, p) - 0.21;
    
    // Max of abs(x), abs(y) and abs(z) minus a constant gives a cube.
    // Adding a little bit of "r," above, rounds off the surfaces a bit.
    p = abs(p); 
	return max(max(p.x, p.y), p.z)*.95 + r*.09 - .21;
    
    
    // Alternative. Egg shapes... kind of.
    //float perturb = sin(p.x*10.)*sin(p.y*10.)*sin(p.z*10.);
	//p += hash33(floor(p))*.2;
	//return length(fract(p)-.5) - .25 + perturb*.05;
	
}


void mainImage( out vec4 fragColor, vec2 fragCoord ) {

    
    // Screen coordinates.
	vec2 uv = (fragCoord - iResolution.xy*.5 )/iResolution.y;
	
    // Unit direction ray. The last term is one of many ways to fish-lens the camera.
    // For a regular view, set "rd.z" to something like "0.5."
    vec3 rd = normalize(vec3(uv, (1. - dot(uv, uv)*.5)*.5)); // Fish lens, for that 1337, but tryhardish, demo look. :)
    
    // There are a few ways to hide artifacts and inconsistencies. Making things go fast is one of them. :)
    // Ray origin, scene color, and surface postion vector.
    vec3 ro = vec3(0, 0, iTime*4.), col = vec3(0), sp;
	
    // Swivel the unit ray to look around the scene.
	float cs = cos( iTime*.375 ), si = sin(iTime*.375);    
    rd.xz = mat2(cs, si,-si, cs)*rd.xz;
    rd.xy = mat2(cs, si,-si, cs)*rd.xy;
    
    // Unit ray jitter is another way to hide artifacts. It can also trick the viewer into believing
    // something hard core, like global illumination, is happening. :)
    rd *= 0.985 + hash33(rd)*.03;
    
    
	// Ray distance, bail out layer number, surface distance and normalized accumulated distance.
	float t=0., layers=0., d, aD;
    
    // Surface distance threshold. Smaller numbers give a sharper object. I deliberately
    // wanted some blur, so bumped it up slightly.
    float thD = .035; // + smoothstep(-0.2, 0.2, sin(iTime*0.75 - 3.14159*0.4))*0.025;
	
    // Only a few iterations seemed to be enough. Obviously, more looks better, but is slower.
	for(int i=0; i<56; i++)	{
        
        // Break conditions. Anything that can help you bail early usually increases frame rate.
        if(layers>15. || col.x>1. || t>10.) break;
        
        // Current ray postion. Slightly redundant here, but sometimes you may wish to reuse
        // it during the accumulation stage.
        sp = ro + rd*t;
		
        d = map(sp); // Distance to nearest point in the cube field.
        
        // If we get within a certain distance of the surface, accumulate some surface values.
        // Values further away have less influence on the total.
        //
        // aD - Accumulated distance. I interpolated aD on a whim (see below), because it seemed 
        // to look nicer.
        //
        // 1/.(1. + t*t*.25) - Basic distance attenuation. Feel free to substitute your own.
        
         // Normalized distance from the surface threshold value to our current isosurface value.
        aD = (thD-abs(d)*15./16.)/thD;
        
        // If we're within the surface threshold, accumulate some color.
        // Two "if" statements in a shader loop makes me nervous. I don't suspect there'll be any
        // problems, but if there are, let us know.
        if(aD>0.) { 
            // Smoothly interpolate the accumulated surface distance value, then apply some
            // basic falloff (fog, if you prefer) using the camera to surface distance, "t."
            col += aD*aD*(3. - 2.*aD)/(1. + t*t*.25)*.2; 
            layers++; 
        }

		
        // Kind of weird the way this works. I think not allowing the ray to hone in properly is
        // the very thing that gives an even spread of values. The figures are based on a bit of 
        // knowledge versus trial and error. If you have a faster computer, feel free to tweak
        // them a bit.
        t += max(abs(d)*.7, thD*1.5); 
        
			    
	}
    
    // I'm virtually positive "col" doesn't drop below zero, but just to be safe...
    col = max(col, 0.);
    
    // Mixing the greytone color and some firey orange with a sinusoidal pattern that
    // was completely made up on the spot.
    col = mix(col, pow(col.x*vec3(1, 1, 1), vec3(1, 1, 1)), 
              dot(sin(rd.yzx*8. + sin(rd.zxy*8.)), vec3(.0)) + .4);
    
    
	// Doing the same again, but this time mixing in some green. I might have gone overboard
    // applying this step. Commenting it out probably looks more sophisticated.
    col = mix(col, vec3(0, 0, 0.4), 
             dot(sin(rd.yzx*4. + sin(rd.zxy*4.)), vec3(.0)) + .3);
    

	// Presenting the color to the screen -- Note that there isn't any gamma correction. That
    // was a style choice.
	fragColor = vec4(max(col, 0.), texture(iChannel0, uv).a);
    
     
 }

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}