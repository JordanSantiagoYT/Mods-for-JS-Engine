// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

uniform float grayIntensity;

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;

    // Sample the original color
    vec4 color = texture(iChannel0, uv);

   float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    vec3 grayscaleColor = vec3(gray);

    // Mix between original and grayscale based on intensity
    vec3 finalColor = mix(color.rgb, grayscaleColor, grayIntensity);

    // Output final color with original alpha
    fragColor = vec4(finalColor, color.a);
}


void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}