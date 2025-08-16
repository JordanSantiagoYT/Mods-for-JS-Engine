#pragma header




//https://github.com/jamieowen/glsl-blend !!!!

float blendOverlay(float base, float blend) {
	return base<0.5?(2.0*base*blend):(1.0-2.0*(1.0-base)*(1.0-blend));
}

vec3 blendOverlay(vec3 base, vec3 blend) {
	return vec3(blendOverlay(base.r,blend.r),blendOverlay(base.g,blend.g),blendOverlay(base.b,blend.b));
}

vec3 blendOverlay(vec3 base, vec3 blend, float opacity) {
	return (blendOverlay(base, blend) * opacity + base * (1.0 - opacity));
}

float blendColorDodge(float base, float blend) {
	return (blend==1.0)?blend:min(base/(1.0-blend),1.0);
}

vec3 blendColorDodge(vec3 base, vec3 blend) {
	return vec3(blendColorDodge(base.r,blend.r),blendColorDodge(base.g,blend.g),blendColorDodge(base.b,blend.b));
}

vec3 blendColorDodge(vec3 base, vec3 blend, float opacity) {
	return (blendColorDodge(base, blend) * opacity + base * (1.0 - opacity));
}

float blendLighten(float base, float blend) {
	return max(blend,base);
}
vec3 blendLighten(vec3 base, vec3 blend) {
	return vec3(blendLighten(base.r,blend.r),blendLighten(base.g,blend.g),blendLighten(base.b,blend.b));
}
vec3 blendLighten(vec3 base, vec3 blend, float opacity) {
	return (blendLighten(base, blend) * opacity + base * (1.0 - opacity));
}

vec3 blendMultiply(vec3 base, vec3 blend) {
	return base*blend;
}
vec3 blendMultiply(vec3 base, vec3 blend, float opacity) {
	return (blendMultiply(base, blend) * opacity + base * (1.0 - opacity));
}

float inv(float val)
{
    return (0.0 - val) + 1.0;
}


//Shader by TheZoroForce240

uniform vec4 overlayColor;
uniform vec4 satinColor; //not proper satin but yea still works
uniform vec4 innerShadowColor;
uniform float innerShadowAngle;
uniform float innerShadowDistance;

float SAMPLEDIST = 5.0;
		
void main()
{	
    vec2 uv = openfl_TextureCoordv.xy;
    vec4 spritecolor = flixel_texture2D(bitmap, uv);    
    vec2 resFactor = 1.0 / openfl_TextureSize.xy;

    
    spritecolor.rgb = blendMultiply(spritecolor.rgb, satinColor.rgb, satinColor.a); //apply satin (but no blur)

    //inner shadow
    float offsetX = cos(innerShadowAngle);
    float offsetY = sin(innerShadowAngle);
    vec2 distMult = (innerShadowDistance*resFactor) / SAMPLEDIST;
    for (int i = 0; i < SAMPLEDIST; i++) //sample nearby pixels to see if theyre transparent, multiply blend by inverse alpha to brighten the edge pixels
    {
        //make sure to use texture2D instead of flixel_texture2D so alpha doesnt effect it
        vec4 col = texture2D(bitmap, uv + vec2(offsetX * (distMult.x * i), offsetY * (distMult.y * i)));
        spritecolor.rgb = blendColorDodge(spritecolor.rgb, innerShadowColor.rgb, innerShadowColor.a * inv(col.a)); //mult by the inverse alpha so it blends from the outside
    }

    spritecolor.rgb = blendLighten(spritecolor.rgb, overlayColor.rgb, overlayColor.a); //apply overlay

    
    gl_FragColor = spritecolor * spritecolor.a;
}