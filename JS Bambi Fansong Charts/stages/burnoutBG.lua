function onCreatePost()
	makeLuaSprite('bg', 'moribundBG', -3000, -1600);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 4, 4);
	addLuaSprite('bg', false);

	makeLuaSprite('plat', 'nihility/platform', -200, 650);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.9, 0.9);
	addLuaSprite('plat', false)

	makeLuaSprite('vig', 'vignette', 0, 0);
	setLuaSpriteScrollFactor('vig', 0, 0);
	addLuaSprite('vig', false)
	setProperty('vig.alpha', 0.6)
	setObjectCamera('vig', 'camHUD')

	makeLuaSprite('redVig', 'redvignette', 0, 0);
	addLuaSprite('redVig', true);
	setLuaSpriteScrollFactor('redVig', 0, 0)
	setProperty('redVig.alpha', 0)
	setObjectCamera('redVig', 'camHUD')

	initLuaShader("burnoutShader")
	setSpriteShader("bg", "burnoutShader")
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/300)
end