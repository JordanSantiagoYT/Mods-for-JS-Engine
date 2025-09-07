ogDadX = 0
ogDadY = 0
crazySpin = false
angleSpin = 0
angleSpeed = 240

function onCreatePost()
	ogDadX = getProperty('oppSprite.x')
	ogDadY = getProperty('oppSprite.y')
end

function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
	doTweenY('opponentmove', 'oppSprite', ogDadY - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)

	if crazySpin then
        	angleSpin = angleSpin + angleSpeed * elapsed
		setProperty('camGame.angle', angleSpin % 360)
	elseif angleSpin > 0 then
		angleSpin = 0
		setProperty('camGame.angle', 0)
	end
end

function onStepHit()
	if curStep == 5632 or curStep == 11776 then
		crazySpin = true
	end
	if curStep == 7680 or curStep == 14336 then
		crazySpin = false
	end
	if curStep == 11776 then angleSpeed = 600 end
	if curStep == 13824 then angleSpeed = 1000 end
    	if curStep == 14336 then angleSpeed = 240 end
end