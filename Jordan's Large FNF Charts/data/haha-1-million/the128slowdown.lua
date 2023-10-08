function onStepHit()
	if curStep == 31 then --2 seconds
	setProperty('playbackRate', 0.25)
	end
	if curStep == 63 then --4 seconds
	setProperty('playbackRate', 1)
	end
	if curStep == 798 then -- 50 seconds
	setProperty('playbackRate', 0.25)
	end
	if curStep == 1566 then --1:02
	setProperty('playbackRate', 1/120)
	end
end