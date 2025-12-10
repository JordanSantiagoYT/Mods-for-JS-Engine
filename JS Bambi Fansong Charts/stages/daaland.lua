function onCreate()
	makeLuaSprite('bg', 'vsdaa/bg', -1500,-1000);
	addLuaSprite('bg', false);
	setScrollFactor('bg', 0, 0);
	addGlitchEffect('bg', 5000, 8000)
	scaleObject('bg', 10,10)

	makeLuaSprite('plat', 'vsdaa/plat', -600, 0);
	addLuaSprite('plat', false);
	scaleObject('plat', 2,2)

	addGrayscaleEffect('camhud', 1,1);
	addGrayscaleEffect('camgame', 1,1)
end