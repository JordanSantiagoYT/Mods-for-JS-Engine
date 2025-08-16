#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define texture flixel_texture2D

uniform float aberration;

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord / iResolution.xy;
    vec2 center = vec2(0.5, 0.5);
    
    // Direction from center
    vec2 dir = normalize(uv - center);
    
    // Distance from center
    float dist = length(uv - center);
    
    // Radial offsets (channels split outward/inward)
    vec2 redOffset   = dir * aberration * dist;
    vec2 blueOffset  = -dir * aberration * dist;

    // Sample shifted channels
    float r = texture(iChannel0, uv + redOffset).r;
    float g = texture(iChannel0, uv).g;
    float b = texture(iChannel0, uv + blueOffset).b;

    fragColor = vec4(r, g, b, texture(iChannel0, uv).a);
}

void main() {
    mainImage(gl_FragColor, openfl_TextureCoordv * openfl_TextureSize);
}
