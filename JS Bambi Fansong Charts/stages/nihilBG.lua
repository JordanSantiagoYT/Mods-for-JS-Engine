function onCreate()
	makeLuaSprite('bg', 'moribundBG', -3000, -1600);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 4, 4);
	addLuaSprite('bg', false);

	makeLuaSprite('plat', 'nihility/platform', -200, 650);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.9, 0.9);
	addLuaSprite('plat', false)

	initLuaShader("GraySmoke")
	setSpriteShader("bg", "GraySmoke")
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/500)
end