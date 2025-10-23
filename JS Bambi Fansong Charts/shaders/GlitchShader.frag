#pragma header
//uniform float tx, ty; // x,y waves phase

//modified version of the wave shader to create weird garbled corruption like messes
uniform float uTime = 0;

/**
 * How fast the waves move over time
 */
uniform float uSpeed = 2;

/**
 * Number of waves over time
 */
uniform float uFrequency = 5;

/**
 * How much the pixels are going to stretch over the waves
 */
uniform float uWaveAmplitude = 0.1 / 3;

vec2 sineWave(vec2 pt)
{
    float x = 0.0;
    float y = 0.0;

    float offsetX = sin(pt.y * uFrequency + uTime * uSpeed) * (uWaveAmplitude / pt.x * pt.y);
    float offsetY = sin(pt.x * uFrequency - uTime * uSpeed) * (uWaveAmplitude / pt.y * pt.x);
    pt.x += offsetX; // * (pt.y - 1.0); // <- Uncomment to stop bottom part of the screen from moving
    pt.y += offsetY;

    return vec2(pt.x + x, pt.y + y);
}

void main()
{
    vec2 uv = sineWave(openfl_TextureCoordv);
    gl_FragColor = texture2D(bitmap, uv);
}
