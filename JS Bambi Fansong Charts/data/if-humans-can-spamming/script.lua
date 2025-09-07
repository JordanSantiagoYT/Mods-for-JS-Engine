floatSpeed = 1
floatX = false
ogDadX = 0

function onCreatePost()
	ogDadX = getProperty('oppSprite.x')
end

oppMove = 'oppSprite'
function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
	doTweenY('opponentmove', oppMove, 0 - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
	if floatX then
		doTweenX('opponentmove2', oppMove, ogDadX - 300*math.sin((currentBeat*0.75)*math.pi * floatSpeed), 0.05)
	end
end

function onStepHit()
	if curStep == 1024 or curStep == 3200 then
		floatX = true
		floatSpeed = 2
	end
	if curStep == 1792 or curStep == 3712 then
		floatX = false
		floatSpeed = 1
	end
	if curStep == 3776 then
		oppMove = 'oppSprite2'
		floatX = true
		floatSpeed = 8
	end
	if curStep == 4800 then
		oppMove = 'oppSprite'
		floatX = false
		floatSpeed = 1
	end
end