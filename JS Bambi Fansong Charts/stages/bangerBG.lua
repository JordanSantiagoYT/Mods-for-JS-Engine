function onCreate()
	-- shader!!
	initLuaShader("teogBG3")

	--graphics for shader
	makeLuaSprite('bg', 'teogBG/Lichen', -1720, -960);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 3, 3)
	setProperty('bg.alpha', 1)
	addLuaSprite('bg', false);

	setSpriteShader("bg", "teogBG3")
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/500)
end