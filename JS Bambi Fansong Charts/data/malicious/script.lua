function onUpdate(elapsed)
	if dadName == 'jeremy-phase2' then
		songPos = getSongPosition()
		local currentBeat = (songPos/2000)*(curBpm/60)
		doTweenY('opponentmove', 'dad', -240 - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
		if not mustHitSection then cameraSetTarget('dad') end
	end
end
