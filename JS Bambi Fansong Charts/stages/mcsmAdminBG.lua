function onCreatePost()

	-- shaders!!
	initLuaShader("fsmBG")

	makeLuaSprite('bg', 'black', -1600, -900);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 3.5, 3.5);
	setProperty('bg.alpha', 1)
	addLuaSprite('bg', false)

	makeLuaSprite('plat', 'imcs/plat1', getProperty('boyfriendGroup.x') - 700, getProperty('boyfriendGroup.y') + 400);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 2, 2);
	addLuaSprite('plat', false)

	setSpriteShader("bg", "fsmBG")
end
function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/2000)
end