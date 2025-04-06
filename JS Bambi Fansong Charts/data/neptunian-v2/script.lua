function onMoveCamera(focus)
	if focus == 'boyfriend' then
		setProperty('defaultCamZoom', 0.8)
	elseif focus == 'dad' then
		setProperty('defaultCamZoom', 0.55)
	end
end

function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/8000)*(curBpm/60)
	doTweenY('opponentmove2', 'oppSprite', -1080 - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
end
