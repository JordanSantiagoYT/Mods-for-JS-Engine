function onCreatePost()
	makeLuaSprite('bg', 'inmbisBG/backs', -1000,-1000);
	addLuaSprite('bg', false);
	setScrollFactor('bg', 0.1, 0.1);
	scaleObject('bg', 1.5,1.5)
	addGlitchEffect('bg', 2,5,0.1)
	screenCenter('bg')

	makeLuaSprite('bg2', 'inmbisBG/cones', -1000,-1000);
	addLuaSprite('bg2', false);
	setScrollFactor('bg2', 0.1, 0.1);
	scaleObject('bg2', 1.5,1.5)
	addGlitchEffect('bg2', 2,5,0.1)
	screenCenter('bg2')

	makeLuaSprite('plat', 'inmbisBG/plat', getProperty('boyfriendGroup.x') - 650, getProperty('boyfriendGroup.y') - 40);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.8, 0.8);
	addLuaSprite('plat', false)

	makeLuaSprite('atmos', 'inmbisBG/atmosphere', 0,-480);
	addLuaSprite('atmos', false);
	setScrollFactor('atmos', 0, 0);
	scaleObject('atmos', 1,1)
	setObjectCamera('atmos', 'camHUD')
	screenCenter('atmos', 'X')
end

function onUpdate(elapsed)
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
	setProperty('atmos.y', -480 + 100*math.sin((currentBeat)), 0.05)
end