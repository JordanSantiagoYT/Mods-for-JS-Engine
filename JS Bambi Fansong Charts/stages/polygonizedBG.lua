function onCreate()
	makeLuaSprite('whatsup','bambiBG/night', -680, -130)
	addLuaSprite('whatsup',false)
	setLuaSpriteScrollFactor('whatsup', 0.1, 0.1)

	makeLuaSprite('thehills','daveshouse/hills', -580, 0)
	addLuaSprite('thehills',false)
	setLuaSpriteScrollFactor('thehills', 0.2, 0.2)
	doTweenColor('thHill', 'thehills', '0xff878787', 0.01, 'quadInOut')

	makeLuaSprite('gates','daveshouse/gate', -750, 610)
	addLuaSprite('gates',false)
	setLuaSpriteScrollFactor('gates', 1, 1)
	doTweenColor('gateLol', 'gates', '0xff878787', 0.01, 'quadInOut')

	makeLuaSprite('ground','daveshouse/grass', -680, 850)
	addLuaSprite('ground',false)
	setLuaSpriteScrollFactor('ground', 1, 1)
	doTweenColor('nightFloor', 'ground', '0xff878787', 0.01, 'quadInOut')

	makeLuaSprite('redBG','redsky',-1475, -775)
	addLuaSprite('redBG',false)
	scaleObject('redBG', 1.75, 1.75);
	addGlitchEffect('redBG',2,5,0.1)
end