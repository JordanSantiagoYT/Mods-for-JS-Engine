function onCreatePost()
    	makeLuaSprite('bg', 'moribund3purp', -1600, -400);
    	addLuaSprite('bg');
    	scaleObject('bg', 3, 3);
	initLuaShader("GraySmokeTwo")
	setSpriteShader("bg", "GraySmokeTwo")
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/300)
end