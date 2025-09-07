// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
uniform sampler2D iChannel1;
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

/*

	Lattice Framework
	-----------------

	I coded up a simple lattice the other day, complete with some joins to jazz it up a 
	bit. At that point, I realized that it had a bit of a "Puls 256b" feel, so added in 
	some bolts to complete the process. I've never looked at the original Puls code, but 
	it'd be interesting to see if it's more efficient. At 256 bytes, it's definitely 
	more compact. :)

	The structure in this particular example is wrapped around a path then rotated about 
	the XY plane according to Z distance. Other than that, it's a very rudimentary scene.

	For anyone interested, the relevant code is contained in the distance function.

	// Very cool 256b demo, and definitely worth a look, if you haven't seen it before.
	Puls (256b) by Rrrola
	http://www.pouet.net/prod.php?which=53816

	// Cool and informative lattice example.
	CC / FCC / BCC Lattices - Paniq
	https://www.shadertoy.com/view/llfGRj

*/

#define FAR 100. // Far plane, or maximum distance.

float objID = 0.; // Object ID - Lattice: 0.; Joins: 1.; Bolts: 2..


// Tri-Planar blending function. Based on an old Nvidia writeup:
// GPU Gems 3 - Ryan Geiss: http://http.developer.nvidia.com/GPUGems3/gpugems3_ch01.html
vec3 tpl( sampler2D t, in vec3 p, in vec3 n ){
   
    n = max(abs(n), 0.001);
    n /= (n.x + n.y + n.z );  
	p = (texture(t, p.yz)*n.x + texture(t, p.zx)*n.y + texture(t, p.xy)*n.z).xyz;
    return p*p;
}


// Camera path. Arranged to coincide with the frequency of the lattice.
vec3 camPath(float t){
  
    //return vec3(0, 0, t); // Straight path.
    return vec3(-sin(t/2.), sin(t/2.)*.5 + 1.57, t); // Windy path.
    
}


// The lattice structure.
float map(in vec3 p){
    
    // Using the Z value to offset the structure by the camera path. Pretty standard.
    p.xy -= camPath(p.z).xy;
    
    // Rotating the structure about the XY plane by an angle dependent on the Z value.
    // Also a pretty standard move that you'll see from time to time.
	vec2 a = sin(vec2(1.57, 0) + p.z*1.57/10.);
    p.xy = mat2(a, -a.y, a.x)*p.xy;
    
    // Rounded cubes, just for fun, and to help visualize things.
    //p = abs(fract(p) - .5);
    //return max(p.x, max(p.y, p.z))*.7 + length(p)*.3 - .2;
    
    // Using repeat properties to produce the octahedral joins. There's probably a 
    // clever way to do both simultaneously, but the following works well enough.
    vec3 q = abs(fract(p + vec3(.5, 0, .5)) - .5);
    float joins = (q.x + q.y + q.z) - .16; // Half of the joins.
    
    p = abs(fract(p + vec3(0, .5, 0)) - .5);
    joins =  min(joins, (p.x + p.y + p.z) - .16); // The other half.
    
    
    // Reusing "p" above to produce the lattice structure. This particular one is called
    // a body-centered lattice, which I think relates back to some form of nomenclature
    // regarding crystalline structure. I was already familiar with the structure, but 
    // learned that it had a fancy name via Paniq's really informative shader here:
    //
    // CC / FCC / BCC Lattices - https://www.shadertoy.com/view/llfGRj
    //
    // Body-centered lattice. My take on it, anyway. I like it because it's cheap and it
    // looks interesting. Basically, you get your money's worth. :)
    //p = abs(p - dot(p, vec3(.333)));
    //float lat = dot(p, vec3(.5)) - 0.034;
    p = abs(p - (p.x + p.y + p.z)*.3333);
    float lat = (p.x + p.y + p.z)*.8 - 0.034;
    
    // Bolts. Constructed by enlarging the lattice tubes and the octahedral joins, then
    // taking the difference.
    float bolts = max(lat - .015, -(joins - .48));
    
    // Object ID. Octahedral joins are blue, and the lattice itself will be white.
    objID = step(joins, lat) + step(bolts, lat)*2.;
    
    // Combined objects and joins.
    return min(min(joins, lat), bolts);
    
    
}


// I keep a collection of occlusion routines... OK, that sounded really nerdy. :)
// Anyway, I like this one. I'm assuming it's based on IQ's original.
float cao(in vec3 p, in vec3 n)
{
	float sca = 1., occ = 0.;
    for(float i=0.; i<5.; i++){
    
        float hr = .01 + i*.35/4.;        
        float dd = map(n * hr + p);
        occ += (hr - dd)*sca;
        sca *= 0.7;
    }
    return clamp(1.0 - occ, 0., 1.);    
}


// The normal function with some edge detection rolled into it.
vec3 nr(vec3 p, inout float edge) { 
	
    vec2 e = vec2(.003, 0);

    // Take some distance function measurements from either side of the hit point on all three axes.
	float d1 = map(p + e.xyy), d2 = map(p - e.xyy);
	float d3 = map(p + e.yxy), d4 = map(p - e.yxy);
	float d5 = map(p + e.yyx), d6 = map(p - e.yyx);
	float d = map(p)*2.;	// The hit point itself - Doubled to cut down on calculations. See below.
     
    // Edges - Take a geometry measurement from either side of the hit point. Average them, then see how
    // much the value differs from the hit point itself. Do this for X, Y and Z directions. Here, the sum
    // is used for the overall difference, but there are other ways. Note that it's mainly sharp surface 
    // curves that register a discernible difference.
    edge = abs(d1 + d2 - d) + abs(d3 + d4 - d) + abs(d5 + d6 - d);
    //edge = max(max(abs(d1 + d2 - d), abs(d3 + d4 - d)), abs(d5 + d6 - d)); // Etc.
    
    // Once you have an edge value, it needs to normalized, and smoothed if possible. How you 
    // do that is up to you. This is what I came up with for now, but I might tweak it later.
    edge = smoothstep(0., 1., sqrt(edge/e.x*2.));
	
    // Return the normal.
    // Standard, normalized gradient mearsurement.
    return normalize(vec3(d1 - d2, d3 - d4, d5 - d6));
}

// Basic raymarcher.
float trace(in vec3 ro, in vec3 rd){

    float t = 0.0, h;
    for(int i = 0; i < 128; i++){
    
        h = map(ro+rd*t);
        // Note the "t*b + a" addition. Basically, we're putting less emphasis on accuracy, as
        // "t" increases. It's a cheap trick that works in most situations... Not all, though.
        if(abs(h)<0.001*max(t*.25, 1.) || t>FAR) break; // Alternative: 0.001*max(t*.25, 1.)
        t += h*.85;
        
    }

    return min(t, FAR);
}



// Shadows.
float sha(in vec3 ro, in vec3 rd, in float start, in float end, in float k){

    float shade = 1.0;
    const int maxIterationsShad = 13; 

    float dist = start;
    float stepDist = end/float(maxIterationsShad);

    for (int i=0; i<maxIterationsShad; i++){
        float h = map(ro + rd*dist);
        //shade = min(shade, k*h/dist);
        shade = min(shade, smoothstep(0.0, 1.0, k*h/dist));

        dist += clamp(h, 0.005, 0.16);
        
        // There's some accuracy loss involved, but early exits from accumulative distance function can help.
        if (abs(h)<0.01 || dist > end) break; 
    }
    
    return min(max(shade, 0.) + 0.1, 1.0); 
}


// Texture bump mapping. Four tri-planar lookups, or 12 texture lookups in total.
vec3 db( sampler2D tx, in vec3 p, in vec3 n, float bf){
   
    const vec2 e = vec2(0.01, 0);
    
    // Three gradient vectors rolled into a matrix, constructed with offset greyscale texture values.    
    mat3 m = mat3( tpl(tx, p - e.xyy, n), tpl(tx, p - e.yxy, n), tpl(tx, p - e.yyx, n));
    
    vec3 g = vec3(0.299, 0.587, 0.114)*m; // Converting to greyscale.
    g = (g - dot(tpl(tx,  p , n), vec3(0.299, 0.587, 0.114)) )/e.x; g -= n*dot(n, g);
                      
    return normalize( n + g*bf ); // Bumped normal. "bf" - bump factor.
	
}

// Compact, self-contained version of IQ's 3D value noise function. I have a transparent noise
// example that explains it, if you require it.
float n3D(vec3 p){
    
	const vec3 s = vec3(7, 157, 113);
	vec3 ip = floor(p); p -= ip; 
    vec4 h = vec4(0., s.yz, s.y + s.z) + dot(ip, s);
    p = p*p*(3. - 2.*p); //p *= p*p*(p*(p * 6. - 15.) + 10.);
    h = mix(fract(sin(h)*43758.5453), fract(sin(h + s.x)*43758.5453), p.x);
    h.xy = mix(h.xz, h.yw, p.y);
    return mix(h.x, h.y, p.z); // Range: [0, 1].
}

// Simple environment mapping. Pass the reflected vector in and create some
// colored noise with it. The normal is redundant here, but it can be used
// to pass into a 3D texture mapping function to produce some interesting
// environmental reflections.
//
// More sophisticated environment mapping:
// UI easy to integrate - XT95    
// https://www.shadertoy.com/view/ldKSDm
vec3 eMap(vec3 rd, vec3 sn){
    
    vec3 sRd = rd; // Save rd, just for some mixing at the end.
    
    // Add a time component, scale, then pass into the noise function.
    rd.xy -= iTime*.5;
    rd *= 2.;
    
    //vec3 tx = tpl(iChannel1, rd/3., sn).zyx;
    //tx = smoothstep(0.2, 1., tx*2.); 
    //float c = dot(tx, vec3(.299, .587, .114));
    
    float c = n3D(rd)*.57 + n3D(rd*2.)*.28 + n3D(rd*4.)*.15; // Noise value.
    c = smoothstep(0.1, 0.5, c); // Darken and add contast for more of a spotlight look.
    
    //vec3 col = vec3(c, c*c, c*c*c*c).zyx; // Simple, warm coloring.
    vec3 col = vec3(min(c*1.5, 1.), pow(c, 2.5), pow(c, 12.)); // More color.
    
    // Mix in some more red to tone it down and return.
    return mix(col, col.yzx, sRd*.5+.5); 
    
}


void mainImage( out vec4 fragColor, in vec2 fragCoord ){
    
    
	// Screen coordinates.
	vec2 u = (fragCoord - iResolution.xy*0.5)/iResolution.y;
	
	// Camera Setup.
    float speed = 0.8;
    vec3 o = camPath(iTime*speed); // Camera position, doubling as the ray origin.
    vec3 lk = camPath(iTime*speed + .1);  // "Look At" position.
    vec3 l = camPath(iTime*speed + 1.); // Light position, somewhere near the moving camera.
	
    // Light postion offset. Since the lattice structure is rotated about the XY plane, the light
    // has to be rotated to match. See the "map" equation.
    vec3 loffs =  vec3(0, 1, 0);
    vec2 a = sin(vec2(1.57, 0) - l.z*1.57/10.);
    loffs.xy = mat2(a, -a.y, a.x)*loffs.xy; 
    l += loffs;

    // Using the above to produce the unit ray-direction vector.
    float FOV = 4.14159/3.; ///3. FOV - Field of view.
    vec3 fwd = normalize(lk-o);
    vec3 rgt = normalize(vec3(fwd.z, 0., -fwd.x )); 
    vec3 up = cross(fwd, rgt);

    // Unit direction ray.
    vec3 r = normalize(fwd + FOV*(u.x*rgt + u.y*up));
    // Lens distortion.
    //vec3 r = fwd + FOV*(u.x*rgt + u.y*up);
    //r = normalize(vec3(r.xy, (r.z - length(r.xy)*.25)));


    // Raymarch.
    float t = trace(o, r);
    
    // Save the object ID directly after the raymarching equation, since other equations that
    // use the "map" function will distort the results. I leaned that the hard way. :)
    float sObjID = objID;

    // Initialize the scene color to the background.
    vec3 col = vec3(0);
    
    // If the surface is hit, light it up.
    if(t<FAR){
    
        // Position and normal.
        vec3 p = o + r*t;
        
        float ed; // Edge variable.
        vec3 n = nr(p, ed);
        
        // Texture bump the normal.
        float sz = 2./1.;
        n = db(iChannel0, p*sz, n, .01/(1. + t/FAR));


        l -= p; // Light to surface vector. Ie: Light direction vector.
        float d = max(length(l), 0.001); // Light to surface distance.
        l /= d; // Normalizing the light direction vector.
        
        float at = 1./(1. + d*.25 + d*d*.1); // Light attenuation.
        
        // Ambient occlusion and shadowing.
        float ao =  cao(p, n);
        float sh = sha(p, l, 0.04, d, 8.);
        
        // Diffuse, specular, fresnel. Only the latter is being used here.
        float di = max(dot(l, n), 0.);
        float sp = pow(max( dot( reflect(r, n), l ), 0.0 ), 16.); // Specular term.
        //float fr = clamp(1.0 + dot(r, n), 0.0, 1.0); // Fresnel reflection term.
        
        // Texturing the surface with some tri-planar mapping..
        vec3 tx = tpl(iChannel0, p*sz, n); // Lattice coloring.
        if(sObjID>1.5) tx *= vec3(1.5); // Lighten the bolts a bit.
        else if(sObjID>.5) tx *= vec3(.5, .7, 1);// Color the joins blue.

		// Very simple coloring.
        col = tx*(di + vec3(1, 10, .1) + vec3(.5, .7, 1)*sp*3.);
        
        // Edges.
        col *= 1. - ed*.7; // Darker edges.
        //col += ed*.5; // Lighter edges.

        // Fake environment mapping.
        vec3 em = eMap(reflect(r, n), n); 
        col += col*em*2.;
        
        // Apply some shading.
        col *= ao*sh*at;

        
    }
    
    // If we've hit the far plane, calulate "l" only.
    if(t>=FAR) l = normalize(l - o - r*FAR);
 	
    // Produce some colored fog.
    vec3 bg = mix(vec3(.5, .7, 1), vec3(1, .5, .6), l.y*.5 + .5);
    col = mix(clamp(col, 0., 1.), bg, smoothstep(0., FAR-2., t));
    
     
    
    // Rough gamma correction, and we're done.
    fragColor = vec4(sqrt(clamp(col, 0., 1.)), texture(iChannel0, fragCoord / iResolution.xy).a);
    
    
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}