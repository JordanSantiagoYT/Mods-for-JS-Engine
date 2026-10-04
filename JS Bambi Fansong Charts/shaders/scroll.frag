#pragma header

vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define time iTime

/*
	shader found here: https://www.shadertoy.com/view/WtGGRt
	
	converting to frag done by Tix.
*/

uniform float xSpeed = 0.5;
uniform float ySpeed = 0;
uniform float timeMulti = 0.2;

void main()
{
   float time = iTime * timeMulti;
	
   // no floor makes it squiqqly
   float xCoord = floor(fragCoord.x + time * xSpeed * iResolution.x); // formula responsable for moving the bitmap/camera on the X axis
   float yCoord = floor(fragCoord.y + time * ySpeed * iResolution.y); // formula responsable for moving the bitmap/camera on the Y axis
	
   vec2 coord = vec2(xCoord, yCoord);
   coord = mod(coord, iResolution.xy);
	
	vec2 uv = coord/iResolution.xy;
   // Time varying pixel color
   //vec3 col = 0.5 + 0.5*cos(iTime+uv.xyx+vec3(0,2,4));
   float col = texture(iChannel0, uv).x;
	
   vec3 color = vec3(col);
   fragColor = vec4(color,1.0) * texture(iChannel0, uv) + texture(iChannel0, uv);
}