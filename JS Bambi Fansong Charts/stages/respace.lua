function onCreate()
	makeLuaSprite("bg", "sarvaBG/galaxy", -900, -500)
	setScrollFactor("bg", 0.1, 0.1)
	scaleObject('bg', 5, 5)
	addGlitchEffect("bg", 2, 2, 0.04)
	addLuaSprite("bg", false)
end