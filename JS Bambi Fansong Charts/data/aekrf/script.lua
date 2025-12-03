function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/120)
	doTweenY('opponentmove', 'dad', -300 - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
	if not mustHitSection then
		cameraSetTarget('dad')
	end
end