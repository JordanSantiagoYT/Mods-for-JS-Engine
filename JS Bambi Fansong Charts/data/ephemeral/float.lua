ogDadX = 0
ogDadY = 0

function onCreatePost()
	ogDadX = getProperty('oppSprite.x')
	ogDadY = getProperty('oppSprite.y')
end

oppMove = 'oppSprite'
function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
	doTweenY('opponentmove', oppMove, ogDadY - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
end