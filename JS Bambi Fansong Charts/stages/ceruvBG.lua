function onCreate()
	makeLuaSprite('theBg','paintybg',-1480,-450)
	setLuaSpriteScrollFactor('theBg', 0, 0)
	scaleObject('theBg', 4, 4)
	addGlitchEffect('theBg', 2,5,0.2);
   	addLuaSprite('theBg',false)

	makeLuaSprite('plat', 'platform mirrored', getProperty('boyfriendGroup.x') - 200, getProperty('boyfriendGroup.y') + 540);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.6, 0.6);
	setProperty('plat.color', getColorFromHex('DDDDDD'))
	addLuaSprite('plat', false)
end