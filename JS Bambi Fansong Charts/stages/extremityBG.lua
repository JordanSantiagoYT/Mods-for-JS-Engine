function onCreatePost()
    	makeLuaSprite('bg', 'soRed', -1600, -400);
    	addLuaSprite('bg');
    	scaleObject('bg', 3, 3);
	initLuaShader("glassyField")
	setSpriteShader("bg", "glassyField")

	makeLuaSprite('theGirlfriend', 'grahbi', 400, 300);
	scaleObject('theGirlfriend', 1, 1);
    	setScrollFactor('theGirlfriend', 1, 1);
	addLuaSprite('theGirlfriend', false);
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/800)
end