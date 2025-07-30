// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

uniform float aberration;

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;

    // Offset the red, green, and blue channels differently
    vec2 redOffset   = vec2(aberration, 0.0);
    vec2 blueOffset  = vec2(-aberration, 0.0);

    // Sample the texture with color channel shifts
    float r = texture(iChannel0, uv + redOffset).r;
    float g = texture(iChannel0, uv).g;
    float b = texture(iChannel0, uv + blueOffset).b;

    // Combine the channels
    fragColor = vec4(r,  g,  b, texture(iChannel0, fragCoord / iResolution.xy).a);
}


void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}