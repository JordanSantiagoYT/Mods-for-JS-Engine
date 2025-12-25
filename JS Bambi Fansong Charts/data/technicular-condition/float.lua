floatSpeed = 1
floatX = false
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
	if floatX then
		doTweenX('opponentmove2', oppMove, ogDadX - 300*math.sin((currentBeat*0.75)*math.pi * floatSpeed), 0.05)
	else setProperty('oppSprite.x', ogDadX)
	end
end

function onStepHit()
	if curStep == 544 or curStep == 1344 then
		floatX = true
		floatSpeed = 2
	end
	if curStep >= 1312 and curStep < 1344 then
		floatX = true
		floatSpeed = floatSpeed * 1.025
	end
	if curStep == 1600 then
		floatSpeed = 5
	end
	if curStep == 800 or curStep == 1856 then
		floatX = false
		floatSpeed = 1
	end
end