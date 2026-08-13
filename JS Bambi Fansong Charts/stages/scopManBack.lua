function onCreate()

	-- shaders!!
	initLuaShader("teogBG1")

	makeLuaSprite('bg', 'black', -1600, -900);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 3.5, 3.5);
	setProperty('bg.alpha', 1)
	addLuaSprite('bg', false)

	makeLuaSprite('plat', 'platform mirrored', getProperty('boyfriendGroup.x') - 150, getProperty('boyfriendGroup.y') + 540);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.6, 0.6);
	setProperty('plat.color', getColorFromHex('CC0000'))
	addLuaSprite('plat', false)

	setSpriteShader("bg", "teogBG1")
end
function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/1000)
end