local timeshit = 0;
local timeshit2 = 0;

function onUpdate(elapsed)
    if curStep == 0 then
    started = true
    end
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/130)

doTweenY('playermove', 'boyfriend', 350 - 350*math.sin((currentBeat+5*10)*math.pi), 2)
doTweenX('disruptor2', 'disruptor2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 5)
doTweenY('disruptor2', 'disruptor2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 5)
doTweenAngle('turnp', 'boyfriend', 0 - 15*math.sin((currentBeat+10*5)*math.pi), 0.2, 'cubeOut')

doTweenY('opponentmove', 'dad', 350 - 350*math.sin((currentBeat+5*20)*math.pi), 2)
doTweenX('disruptor2', 'disruptor2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 5)
doTweenY('disruptor2', 'disruptor2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 5)
doTweenAngle('turnd', 'dad', 0 + 15*math.sin((currentBeat+10*5)*math.pi), 0.2, 'cubeOut')
end