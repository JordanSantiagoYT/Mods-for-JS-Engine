local angley = 0

function onBeatHit()
	if curBeat % 4 == 0 then
		angley = angley + 1000
		for i = 0, 7 do
			noteTweenAngle('spin'..i, i, angley + 1000, 220 / curBpm, 'expoOut')
		end
	end
end

function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
	doTweenY('opponentmove', 'dad', 150 - 150*math.sin((currentBeat+12*12)*math.pi), 2)
	if not mustHitSection then
		cameraSetTarget('dad')
	end
end