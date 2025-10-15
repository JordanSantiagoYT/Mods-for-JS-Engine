// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

#define TAU 6.28318530718

#define TILING_FACTOR 1.0
#define MAX_ITER 8


float waterHighlight(vec2 p, float time, float foaminess)
{
    vec2 i = vec2(p);
	float c = 0.0;
    float foaminess_factor = mix(1.0, 6.0, foaminess);
	float inten = .005 * foaminess_factor;

	for (int n = 0; n < MAX_ITER; n++) 
	{
		float t = time * (0.0 - (3.5 / float(n+1)));
		i = p + vec2(cos(t - i.x) + sin(t + i.y), sin(t - i.y) + cos(t + i.x));
		c += 1.0/length(vec2(p.x / (sin(i.x+t)),p.y / (cos(i.y+t))));
	}
	c = 0.2 + c / (inten * float(MAX_ITER));
	c = 1.17-pow(c, 1.4);
    c = pow(abs(c), 8.0);
	return c / sqrt(foaminess_factor);
}


void mainImage( out vec4 fragColor, in vec2 fragCoord ) 
{
	float time = iTime * 0.02+23.0;
	vec2 uv = fragCoord.xy / iResolution.xy;
	vec2 uv_square = vec2(uv.x * iResolution.x / iResolution.y, uv.y);
    float dist_center = pow(1.0*length(uv - 0.5), 0.5);
    
    float foaminess = smoothstep(0.4, 8.0, dist_center);
    float clearness = 0.9 + 0.5*smoothstep(0.5, 0.1, dist_center);
    
	vec2 p = mod(uv_square*TAU*TILING_FACTOR, TAU)-250.0;
    
    float c = waterHighlight(p, time, foaminess);
    
    vec3 water_color = vec3(0.2, 0.2, 0.2);
	vec3 color = vec3(c);
    color = clamp(color + water_color, 0.0, 1.0);
    
    color = mix(water_color, color, clearness);

	fragColor = vec4(color, texture(iChannel0, fragCoord / iResolution.xy).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}