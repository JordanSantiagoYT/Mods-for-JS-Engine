function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
	if dadName == 'dave-3d' then
		doTweenY('opponentmove', 'dad', 140 - 60*math.sin((currentBeat*0.75)*math.pi), 0.05)
		if not mustHitSection then
			cameraSetTarget('dad')
		end
	end
end