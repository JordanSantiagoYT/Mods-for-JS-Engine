function onCreatePost()
    	makeLuaSprite('bg', 'soRed', -1800, -600);
    	addLuaSprite('bg');
    	scaleObject('bg', 3, 3);
	initLuaShader("CryptyDanBG")
	setSpriteShader("bg", "CryptyDanBG")
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/1000)
end