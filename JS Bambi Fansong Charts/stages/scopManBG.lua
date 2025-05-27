function onCreate()

	-- shaders!!
	initLuaShader("teogBG1")

	makeLuaSprite('bg', 'black', -1600, -900);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 3.5, 3.5);
	setProperty('bg.alpha', 1)
	addLuaSprite('bg', false)

	setSpriteShader("bg", "teogBG1")
end
function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/500)
end