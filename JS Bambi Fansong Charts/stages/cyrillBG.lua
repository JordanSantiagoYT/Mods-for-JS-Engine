function onCreate()
	makeLuaSprite('bg', 'cyrill/cyrillGalaxy', -675, -475);
	scaleObject('bg', 1.75, 1.75);
	addLuaSprite('bg', false)
	addGlitchEffect('bg', 2, 5, 0.1)

	makeLuaSprite('plat', 'cyrill/cyrillPlat', 750, 750);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.9, 0.9);
	addLuaSprite('plat', false)
end