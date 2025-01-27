function onCreate()
	makeLuaSprite('bg', 'gateway/bg', -3050, -2030);
	scaleObject('bg', 3, 3);
   	setScrollFactor('bg', 0, 0);
	addLuaSprite('bg', false);
	addGlitchEffect('bg', 2, 5, 0.1);

	--Guided Jeremy
	makeLuaSprite('opp1', 'gateway/char1', -420, 30);
	scaleObject('opp1', 0.4, 0.4);
    	setScrollFactor('opp1', 1, 1);
	addLuaSprite('opp1', false);
	setProperty('opp1.alpha', 0)

	--Guided Neptune
	makeLuaSprite('opp2', 'gateway/char2', -180, -1600);
	scaleObject('opp2', 1.3, 1.3);
    	setScrollFactor('opp2', 1, 1);
	addLuaSprite('opp2', false);
	setProperty('opp2.alpha', 0)

	--True TimeLaserz
	makeLuaSprite('opp3', 'gateway/char3', 420, -1350);
	scaleObject('opp3', 3.1, 3.1);
    	setScrollFactor('opp3', 1, 1);
	addLuaSprite('opp3', false);
	setProperty('opp3.alpha', 0)

	--Conbi G
	makeLuaSprite('opp4', 'gateway/char4', -280, -2100);
	scaleObject('opp4', 0.7, 0.7);
    	setScrollFactor('opp4', 1, 1);
	addLuaSprite('opp4', false);
	setProperty('opp4.alpha', 0)
end

function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
	doTweenY('opponentmove', 'opp1', 50 - 100*math.sin((currentBeat*0.5)*math.pi), 0.05)
	if not mustHitSection and dadName == 'gatewayJeremy' then
		cameraSetTarget('dad')
	end
end

function onBeatHit()
	if curBeat % 4 == 0 then
		setProperty('iconP2.angle', -360)
		doTweenAngle('coolOppIcon', 'iconP2', 0, curBpm/60/8, 'expoOut')
		setProperty('iconP1.angle', 360)
		doTweenAngle('coolBFIcon', 'iconP1', 0, curBpm/60/8, 'expoOut')
	end
	if curBeat == 4432 then
		doTweenAlpha('byeConbi', 'opp4', 0, 6, 'linear')
	end
end