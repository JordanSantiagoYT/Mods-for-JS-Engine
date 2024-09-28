function onCreate()
	makeLuaSprite('whatsup','daveshouse/sky', -680, -130)
	addLuaSprite('whatsup',false)
	setLuaSpriteScrollFactor('whatsup', 0.1, 0.1)

	makeLuaSprite('thehills','daveshouse/hills', -580, 0)
	addLuaSprite('thehills',false)
	setLuaSpriteScrollFactor('thehills', 0.2, 0.2)

	makeLuaSprite('gates','daveshouse/gate', -750, 610)
	addLuaSprite('gates',false)
	setLuaSpriteScrollFactor('gates', 1, 1)

	makeLuaSprite('ground','daveshouse/grass', -680, 850)
	addLuaSprite('ground',false)
	setLuaSpriteScrollFactor('ground', 1, 1)
	close(true)

end