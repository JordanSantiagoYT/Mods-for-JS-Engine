function onCreate()
	makeLuaSprite('theBg','HellbreakerNewBG',-680,-350)
	setLuaSpriteScrollFactor('theBg', 0, 0)
	scaleObject('theBg', 2.5, 2.5)
	addGlitchEffect('theBg', 2,5,0.2);
   	addLuaSprite('theBg',false)

	makeLuaSprite('plat', 'platform mirrored', getProperty('boyfriendGroup.x') - 150, getProperty('boyfriendGroup.y') + 540);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.6, 0.6);
	setProperty('plat.color', getColorFromHex('7D0000'))
	addLuaSprite('plat', false)

	makeLuaSprite('gfPlat', 'platform mirrored', getProperty('gfGroup.x') - 260, getProperty('gfGroup.y') + 400);
	setScrollFactor('gfPlat', 1, 1);
	scaleObject('gfPlat', 0.9, 0.9);
	setProperty('gfPlat.color', getColorFromHex('7D0000'))
	addLuaSprite('gfPlat', false)
end