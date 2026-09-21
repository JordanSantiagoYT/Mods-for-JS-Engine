function onCreatePost()
	makeLuaSprite('bg', 'evilZBG', -1000,-1000);
	addLuaSprite('bg', false);
	setScrollFactor('bg', 0.1, 0.1);
	scaleObject('bg', 2,2)
	setProperty('bg.alpha', 1)
	setProperty('bg.angularVelocity', 30)
	screenCenter('bg')

	makeLuaSprite('plat', 'platform mirrored', getProperty('boyfriendGroup.x') - 150, getProperty('boyfriendGroup.y') + 540);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.6, 0.6);
	setProperty('plat.color', getColorFromHex('7D0000'))
	addLuaSprite('plat', false)
end