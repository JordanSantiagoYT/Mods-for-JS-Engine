function onCreatePost()
	makeLuaSprite("bg", "moribund3purp", -2500, -1200)
	setScrollFactor("bg", 0.1, 0.1)
	scaleObject('bg', 5, 5)
	initLuaShader("OrangeStream", 120)
	setSpriteShader("bg", "OrangeStream")
	addLuaSprite("bg", false)

	makeLuaSprite('plat', 'green/Ground', getProperty('boyfriendGroup.x') - 800, getProperty('boyfriendGroup.y') + 370);
	setScrollFactor('plat', 1, 1);
	setProperty('plat.color', getColorFromHex('e36d00'))
	scaleObject('plat', 1.3, 1.3);
	addLuaSprite('plat', false)
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/2500)
end