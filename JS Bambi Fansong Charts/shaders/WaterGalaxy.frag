// https://www.shadertoy.com/view/3lX3DM
// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
  vec2 uv = (fragCoord.xy - .5 * iResolution.xy) / iResolution.y;

  vec3 color = vec3(0);

  float t = (sin(iTime * .6) * .4 + .6);
  float a = atan(uv.y, uv.x);
  float l = length(uv);

  vec2 rt = vec2(cos(iTime * .3), sin(iTime * .3)) * 5.;
  vec2 p1 = vec2(cos(l * 120. + iTime), sin(l * 20. + iTime * .5));
  vec2 p2 = vec2(cos(a + l * 30. + iTime), sin(a - l * 20. + iTime * .4)) * 5.;

  vec2 st = uv * 18.;
  color += 1. / length(st + p1) * t; // spark

  color += 1. / dot(st + p2, st + p2) * t; // spark
  
  color *= mix(
      color, vec3(abs(1. - uv.x)), 
      smoothstep(.01, .1, 1. / dot(st + p2 * rt, st + p2 - rt) / t)); // spark

  st += rt + pow(p1, vec2(7.));
  color += 1. / dot(st, st) * t; // spark

  fragColor = vec4(color, texture(iChannel0, fragCoord / iResolution.xy).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}