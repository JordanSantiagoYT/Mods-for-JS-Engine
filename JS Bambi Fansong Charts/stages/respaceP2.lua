function onCreatePost()
	makeLuaSprite("bg", "sarvaBG/galaxy", -900, -500)
	setScrollFactor("bg", 0.1, 0.1)
	scaleObject('bg', 5, 5)
	initLuaShader("TransparentLatticePhase2")
	setSpriteShader("bg", "TransparentLatticePhase2")
	addLuaSprite("bg", false)

	makeLuaSprite('plat', 'nihility/platform', getProperty('boyfriendGroup.x') - 200, getProperty('boyfriendGroup.y') + 640);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.9, 0.9);
	addLuaSprite('plat', false)
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/600)
end