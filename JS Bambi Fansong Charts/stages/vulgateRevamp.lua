function onCreatePost()
    	makeLuaSprite('vulgate', 'vulgate', -800, -300);
    	addLuaSprite('vulgate');
    	scaleObject('vulgate', 3, 3);
	initLuaShader("GreenSmoke")
	setSpriteShader("vulgate", "GreenSmoke")
end

function onUpdate(elapsed)
	setShaderFloat('vulgate', 'iTime', getSongPosition()/300)
end