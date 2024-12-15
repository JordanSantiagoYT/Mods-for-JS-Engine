function onCreate()
	makeLuaSprite("bg", "sarvaBG/galaxy", -900, -500)
	setScrollFactor("bg", 0.1, 0.1)
	scaleObject('bg', 5, 5)
	initLuaShader("TransparentLattice")
	setSpriteShader("bg", "TransparentLattice")
	addLuaSprite("bg", false)
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/800)
end