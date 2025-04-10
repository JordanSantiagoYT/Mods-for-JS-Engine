function onCreate()

	-- shaders!!
	initLuaShader("teogBGFinal", 140) --version 140 because otherwise it'll crash lol

	--graphics for shaders

	makeLuaSprite('bg4', 'black', -1600, -900);
	setLuaSpriteScrollFactor('bg4', 0, 0);
	scaleObject('bg4', 3.5, 3.5);
	setProperty('bg4.alpha', 1)
	addLuaSprite('bg4', false)

	setSpriteShader("bg4", "teogBGFinal")
end

function onUpdate(elapsed)
	setShaderFloat('bg4', 'iTime', getSongPosition()/500)
end