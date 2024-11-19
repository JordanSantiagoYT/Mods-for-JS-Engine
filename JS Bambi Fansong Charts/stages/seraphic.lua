function onCreate()

	makeLuaSprite('bg','seraphicBG/bg',-1400,-900)
	addLuaSprite('bg',false)
 	scaleObject('bg', 3, 3)
    	addGlitchEffect('bg', 2, 6);
	setLuaSpriteScrollFactor('bg', 0.25, 0.25)

	makeLuaSprite('plat', 'seraphicBG/plat', -1250, 250);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 5, 5);
	addLuaSprite('plat', false)
end