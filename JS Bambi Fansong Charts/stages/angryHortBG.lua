function onCreate()
	makeLuaSprite('bg', 'moribundBG', -900, -300);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 1.6, 1.6);
	addLuaSprite('bg', false);

	initLuaShader("DigitalBrainPurple")
	setSpriteShader("bg", "DigitalBrainPurple")
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/600)
end