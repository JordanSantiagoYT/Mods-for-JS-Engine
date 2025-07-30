// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

uniform float glowIntensity;

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;
    
    // Sample the base color
    vec4 color = texture(iChannel0, uv);
    
    // Glow effect using a simple blur (sampling surrounding pixels)
    vec4 glow = vec4(0.0);

    for (float x = -2.0; x <= 2.0; x += 1.0)
    {
        for (float y = -2.0; y <= 2.0; y += 1.0)
        {
            vec2 offset = vec2(x, y) / iResolution.xy;
            glow += texture(iChannel0, uv + offset) * 0.1;
        }
    }

    // Combine the original color with the glow
    fragColor = color + glow * glowIntensity;
}


void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}