ogDadY = 0
function onCreatePost()
	ogDadY = getProperty('dad.y')
end
function onUpdate(elapsed)
	songPos = getSongPosition()
	local currentBeat = (songPos/2000)*(curBpm/240)
	doTweenY('opponentmove', 'dad', ogDadY - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
	if not mustHitSection then cameraSetTarget('dad') end
end
