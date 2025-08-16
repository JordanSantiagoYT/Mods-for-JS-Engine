#pragma header
//uniform float tx, ty; // x,y waves phase

//modified version of the wave shader to create weird garbled corruption like messes
uniform float uTime = 0;

/**
 * How fast the waves move over time
 */
uniform float uSpeed = 22.59;

/**
 * Number of waves over time
 */
uniform float uFrequency = 13.24;

/**
 * How much the pixels are going to stretch over the waves
 */
uniform float uWaveAmplitude = -0.3;

vec2 sineWave(vec2 pt)
{
    float x = 0.0;
    float y = 0.0;

    float offsetX = cos(pt.y / uWaveAmplitude * uFrequency - uTime * uSpeed / 5) * 2 / 4 * (uWaveAmplitude / pt.x * pt.x)/ 3;
    float offsetY = cos(pt.x / uWaveAmplitude * uFrequency + uTime * uSpeed / 3) * 2 / 3 * (uWaveAmplitude / pt.y * pt.y)/ 4;
    pt.x += offsetX * 2.5; // * (pt.y - 5.0); // <- Uncomment to stop bottom part of the screen from moving
    pt.y += offsetY * 2.2;

    return vec2(pt.x + x + y, pt.y + y + x);
}

void main()
{
    vec2 uv = sineWave(openfl_TextureCoordv);
    gl_FragColor = texture2D(bitmap, uv);
}
