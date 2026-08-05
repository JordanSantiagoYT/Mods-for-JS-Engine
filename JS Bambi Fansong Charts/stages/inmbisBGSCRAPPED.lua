function onCreatePost()
	makeLuaSprite('bg', 'inmbisBG/backs', -1000,-1000);
	addLuaSprite('bg', false);
	setScrollFactor('bg', 0.1, 0.1);
	scaleObject('bg', 1.5,1.5)
	screenCenter('bg')

	makeLuaSprite('bg2', 'inmbisBG/cones', -1000,-1000);
	addLuaSprite('bg2', false);
	setScrollFactor('bg2', 0.1, 0.1);
	scaleObject('bg2', 1.5,1.5)
	screenCenter('bg2')

	makeLuaSprite('plat', 'inmbisBG/plat', getProperty('boyfriendGroup.x') - 650, getProperty('boyfriendGroup.y') - 40);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.8, 0.8);
	addLuaSprite('plat', false)

	makeLuaSprite('backpillars', 'inmbisBG/backpillars', getProperty('plat.x') - 650, getProperty('plat.y') - 40);
	setScrollFactor('backpillars', 1, 1);
	scaleObject('backpillars', 1.4, 1.4);
	addLuaSprite('backpillars', false)
	setObjectOrder('backpillars', getObjectOrder('plat'))

	makeLuaSprite('frontpillars', 'inmbisBG/frontpillars', getProperty('plat.x') - 850, getProperty('plat.y') - 180);
	setScrollFactor('frontpillars', 1, 1);
	scaleObject('frontpillars', 1.5, 1.5);
	addLuaSprite('frontpillars', false)

	makeLuaSprite('atmos', 'inmbisBG/atmosphere', 0,-480);
	addLuaSprite('atmos', false);
	setScrollFactor('atmos', 0, 0);
	scaleObject('atmos', 1,1)
	setObjectCamera('atmos', 'camHUD')
	screenCenter('atmos', 'X')
end