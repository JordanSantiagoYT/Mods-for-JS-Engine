function onCreate()
	makeLuaSprite('moribundBG', 'moribundBG', -1200, -700);
	setLuaSpriteScrollFactor('moribundBG', 0, 0);
	scaleObject('moribundBG', 2.2, 2.2);
	addLuaSprite('moribundBG', false);

	initLuaShader("moribund")
	setSpriteShader("moribundBG", "moribund")
end

function onUpdate(elapsed)
	setShaderFloat('moribundBG', 'iTime', getSongPosition()/800)
end