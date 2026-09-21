#pragma header

// ZGameEditor -> OpenFL/Flixel conversion

#define iResolution vec3(openfl_TextureSize, 0.0)
#define iChannel0 bitmap
#define texture texture2D

uniform float iTime;

// Original parameters
uniform float dist;
uniform float alpha;
uniform float pi;

// Optional viewport offset.
// Usually these can just remain 0 in Flixel.
uniform float viewportX;
uniform float viewportY;

float GlitchAmount = 0.01 + dist;

vec4 posterize(vec4 color, float numColors)
{
    return floor(color * numColors - 0.5) / numColors;
}

vec2 quantize(vec2 v, float steps)
{
    return floor(v * steps) / steps;
}

float distanceFunc(vec2 a, vec2 b)
{
    return sqrt(
        pow(b.x - a.x, 2.0) +
        pow(b.y - a.y, 2.0)
    );
}

void main()
{
    vec2 fragCoord = openfl_TextureCoordv * openfl_TextureSize;
    vec2 uv = openfl_TextureCoordv;

    float amount = pow(GlitchAmount, 2.0);

    vec2 pixel = (1.0 * pi) / iResolution.xy;

    vec4 color = texture(iChannel0, uv);

    float t = mod(
        mod(
            iTime,
            amount * 100.0 * (amount - 0.5)
        ) * 109.0,
        1.0
    );

    vec4 postColor = posterize(color, 16.0);

    vec4 a = posterize(
        texture(
            iChannel0,
            quantize(uv, 64.0 * t)
            + pixel * (postColor.rb - vec2(0.5)) * 100.0
        ),
        5.0
    ).rbga;

    vec4 b = posterize(
        texture(
            iChannel0,
            quantize(uv, 32.0 - t)
            + pixel * (postColor.rg - vec2(0.5)) * 1000.0
        ),
        4.0
    ).gbra;

    vec4 c = posterize(
        texture(
            iChannel0,
            quantize(uv, 16.0 + t)
            + pixel * (postColor.rg - vec2(0.5)) * 20.0
        ),
        16.0
    ).bgra;

    vec4 fin = vec4(1.0);

    fin = mix(
        texture(
            iChannel0,
            uv
            + amount
            * (
                quantize(
                    (
                        a * t
                        - b
                        + c
                        - (t + t / 2.0) / 10.0
                    ).rg,
                    16.0
                )
                - vec2(0.5)
            )
            * pixel
            * 100.0
        ),

        (a + b + c) / 3.0,

        (0.5 - (dot(color, postColor) - 1.5)) * amount
    );

    // Original:
    // vec2 ogRes = fragCoord / iResolution.xy;
    //
    // Since fragCoord is effectively the pixel position,
    // this is equivalent to using normalized coordinates.
    vec2 ogRes = fragCoord / iResolution.xy;

    vec4 Color1 = texture(iChannel0, ogRes);

    fin.rgb = mix(
        fin.rgb,
        Color1.rgb,
        alpha
    );

    gl_FragColor = fin;
}