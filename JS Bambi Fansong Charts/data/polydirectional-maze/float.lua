ogDadY = 0

function onCreatePost()
	ogDadY = getProperty('dad.y')
end
function onUpdate(elapsed)
    if curStep == 0 then
    started = true
    end
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/130)
	if dadName == 'kalmpokebam' then
		doTweenY('opponentmove', 'dad', 0 - 350*math.sin((currentBeat+5*20)*math.pi), 2)
		if not mustHitSection then
			cameraSetTarget('dad')
		end
	end
	if not dadName == 'kalmpokebam' and getProperty('dad.y') == ogDadY then
		setProperty('dad.y', ogBFY)
	end
end