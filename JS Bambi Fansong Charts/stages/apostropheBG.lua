function onCreatePost()
    	makeLuaSprite('bg', 'nothing', -1600, -400);
    	addLuaSprite('bg');
    	scaleObject('bg', 3, 3);
	initLuaShader("apostrophe")
	setSpriteShader("bg", "apostrophe")
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/400)
end