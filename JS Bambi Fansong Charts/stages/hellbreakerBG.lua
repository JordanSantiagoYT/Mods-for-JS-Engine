function onCreate()

	makeLuaSprite('theBg','HellbreakerBG',-280,-50)
	setLuaSpriteScrollFactor('theBg', 0, 0)
	scaleObject('theBg', 2.5, 2.5)
	addGlitchEffect('theBg', 2,5,0.2);
   	addLuaSprite('theBg',false)

end