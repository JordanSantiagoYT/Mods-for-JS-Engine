ogDadY = 0
function onCreatePost()
	ogDadY = getProperty('oppSprite.y')
end
function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
	doTweenY('opponentmove', 'oppSprite', ogDadY - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
end