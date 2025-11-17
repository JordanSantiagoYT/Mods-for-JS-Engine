ogDadY = 0
function onCreatePost()
	ogDadY = getProperty('dad.y')
end
function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/240)
	doTweenY('opponentmove', 'dad', ogDadY - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
	if not mustHitSection then
		cameraSetTarget('dad')
	end
end

function onMoveCamera(focus)
	if focus == 'boyfriend' then
		setProperty('defaultCamZoom', 0.8)
	elseif focus == 'dad' then
		setProperty('defaultCamZoom', 0.6)
	end
end

