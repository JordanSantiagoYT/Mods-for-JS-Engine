function onCreate()
	makeLuaSprite('bg', 'antagonism/AntagBG', -3250, -2030);
	scaleObject('bg', 2.2, 2.2);
   	setScrollFactor('bg', 0, 0);
	addLuaSprite('bg', false);
	addGlitchEffect('bg', 2, 10, 0.2);

	makeLuaSprite('plat', 'antagonism/AntagPlatform', -200, 650);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.9, 0.9);
	addLuaSprite('plat', false)
end

function onBeatHit()
	if curBeat % 8 == 0 then
		setProperty('iconP2.angle', -360)
		doTweenAngle('coolOppIcon', 'iconP2', 0, curBpm/60/8, 'expoOut')
		setProperty('iconP1.angle', 360)
		doTweenAngle('coolBFIcon', 'iconP1', 0, curBpm/60/8, 'expoOut')
	end
end