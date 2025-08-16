floatSpeed = 1
floatCrazy = false
ogDadX = 0

function onCreatePost()
	ogDadX = getProperty('oppSprite.x')
end
function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60) * floatSpeed
	doTweenY('opponentmove', 'oppSprite', -400 - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
	if floatCrazy then
		doTweenX('opponentmove2', 'oppSprite', ogDadX - 300*math.sin((currentBeat*0.75)*math.pi * 8), 0.05)
	end
end

function onStepHit()
	if curStep == 1536 then floatSpeed = 3 end
	if curStep == 3584 then floatSpeed = 1 end
	if curStep == 4800 then
		floatCrazy = true
	end
	if curStep == 6336 then
		floatCrazy = false
		setProperty('oppSprite.x', ogDadX)
	end
	if curStep == 6337 then
		setProperty('oppSprite.x', ogDadX)
	end
end