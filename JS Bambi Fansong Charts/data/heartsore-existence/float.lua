local timeshit = 0;
local timeshit2 = 0;

function onUpdate(elapsed)
    if curStep == 0 then
    started = true
    end
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/130)

doTweenY('playermove', 'boyfriend', 350 - 350*math.sin((currentBeat+5*10)*math.pi), 2)
doTweenAngle('turnp', 'boyfriend', 0 - 15*math.sin((currentBeat+10*5)*math.pi), 0.2, 'cubeOut')

doTweenY('opponentmove', 'dad', 200 - 350*math.sin((currentBeat+5*20)*math.pi), 2)
doTweenAngle('turnd', 'dad', 0 + 15*math.sin((currentBeat+10*5)*math.pi), 0.2, 'cubeOut')

	if not mustHitSection then cameraSetTarget('dad')
	else cameraSetTarget('boyfriend') end
end