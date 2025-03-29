function onCreate()
	initLuaShader("teogBG3")

	makeLuaSprite('bg', 'teogBG/SmallNoise', -1600, -900);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 75, 42.3)
	setProperty('bg.alpha', 1)
	addLuaSprite('bg', false);

	setSpriteShader("bg", "teogBG3")
end
function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/300)
end