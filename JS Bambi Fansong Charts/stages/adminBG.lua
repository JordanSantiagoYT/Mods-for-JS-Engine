function onCreatePost()
    	makeLuaSprite('bg', 'soRed', -1600, -400);
    	addLuaSprite('bg');
    	scaleObject('bg', 3, 3);
	initLuaShader("mobiusSierp")
	setSpriteShader("bg", "mobiusSierp")
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/2000)
end