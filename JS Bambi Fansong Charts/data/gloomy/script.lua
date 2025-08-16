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
	doTweenX('opponentmove2', 'oppSprite', -100 - 400*math.sin((currentBeat*0.75)*math.pi * floatSpeed), 0.05)
end

function onStepHit()
	if curStep == 768 or curStep == 1536 then floatSpeed = 1.5 end
	if curStep == 1280 or curStep == 2048 or curStep == 2624 then floatSpeed = 1 end
	if curStep == 2112 then floatSpeed = 6 end
end