local amountOfLoops = 0
local slowLoopNow = false
function onStepHit()
	if curStep == 39 then
		if (amountOfLoops < 15) then
			amountOfLoops = amountOfLoops + 1
			loopTheSong(0)
			setProperty('playbackRate', playbackRate * 1.2)
		end
		if not slowLoopNow and amountOfLoops == 15 then
			setProperty('playbackRate', 0.9)
			loopTheSong(0)
			slowLoopNow = true
		end
		if slowLoopNow then
			loopTheSong(0)
			setProperty('playbackRate', playbackRate / 1.2)
		end
	end
end
function onCreatePost()
	setProperty('shouldKillNotes', false)
end