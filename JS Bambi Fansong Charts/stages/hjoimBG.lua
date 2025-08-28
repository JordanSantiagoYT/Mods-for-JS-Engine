function onCreate()
	makeLuaSprite('bg', 'moribundBG', -1700, -900);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 2, 2);
	addLuaSprite('bg', false);

	makeLuaSprite('plat', 'nihility/platform', -200, 650);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.9, 0.9);
	addLuaSprite('plat', false)

	initLuaShader("hjoimShader")
	setSpriteShader("bg", "hjoimShader")
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/400)
end