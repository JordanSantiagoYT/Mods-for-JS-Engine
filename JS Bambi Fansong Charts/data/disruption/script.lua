function opponentNoteHit()
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.005');
	health = getProperty('health')
	if health > 0.1 then
		setProperty('health', health- 0.01);
	end
end

function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
	doTweenY('opponentmove', 'dad', -100 - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
	if not mustHitSection then
		cameraSetTarget('dad')
	end
end