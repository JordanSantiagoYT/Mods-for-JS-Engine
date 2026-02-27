function onCreatePost()

	-- shaders!!
	initLuaShader("Intermediate")

	makeLuaSprite('bg', 'black', -1600, -900);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 3.5, 3.5);
	setProperty('bg.alpha', 1)
	addLuaSprite('bg', false)

	makeLuaSprite('plat', 'platform mirrored', getProperty('boyfriendGroup.x') - 150, getProperty('boyfriendGroup.y') + 540);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.6, 0.6);
	addLuaSprite('plat', false)

	makeLuaSprite('plat2', 'platform mirrored', getProperty('dadGroup.x') - 150, getProperty('dadGroup.y') + 540);
	setScrollFactor('plat2', 1, 1);
	scaleObject('plat2', 0.6, 0.6);
	addLuaSprite('plat2', false)

	setSpriteShader("bg", "Intermediate")
end
function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/1000)
end