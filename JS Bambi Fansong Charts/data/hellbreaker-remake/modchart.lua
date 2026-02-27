strumYUpscroll = 50
strumYDownscroll = 570
function onStepHit()
	if curStep == 511 then
		noteSpin = true
		noteBop = true
	end
	if curStep == 1023 then
		coolPart = true
	end
	if curStep == 1534 or curStep == 2559 then
		noteSpin = false
		noteBop = false
		coolPart = false
	end
	if curStep == 2047 then
		noteSpin = true
		noteBop = true
		coolPart = true
	end
end

canNoteTwist = false
noteTwist = false
noteSpin = false
coolPart = false
noteBop = false
function onBeatHit()
	if canNoteTwist then
		if curBeat % 2 == 0 then
			noteTwist = not noteTwist
			for i = 0, getProperty('strumLineNotes.length') - 1 do
				noteTweenAngle('twist'..i, i, (noteTwist and 15 or -15), 100 / curBpm, 'expoOut')
			end
		end
	end
	if noteSpin then
		if curBeat % 4 == 2 then
			for i = 0, 7 do
				noteTweenAngle('spin'..i, i, 360, 230 / curBpm, 'expoOut')
			end
		end
	end
	if noteBop then
		if curBeat % 2 == 0 then
			for i = 0, 7 do
				noteTweenScaleX('bigN'..i..'X', i, 1.2, 0.001, 'expoOut')
				noteTweenScaleY('bigN'..i..'Y', i, 1.2, 0.001, 'expoOut')
				noteTweenScaleX('backN'..i..'X', i, 1, (100/curBpm), 'expoOut')
				noteTweenScaleY('backN'..i..'Y', i, 1, (100/curBpm), 'expoOut')
			end
		end
	end
	if coolPart then
		if curBeat % 2 == 0 then
			for i = 0, getProperty('strumLineNotes.length') - 1 do
				noteTweenY('noteJump'..i, i, (not VertScroll and strumYUpscroll - 30 or strumYDownscroll + 30), 60 / curBpm, 'sineOut')
			end
		end
		if curBeat % 2 == 1 then
			for i = 0, getProperty('strumLineNotes.length') - 1 do
				noteTweenY('noteFall'..i, i, (not VertScroll and strumYUpscroll or strumYDownscroll), 60 / curBpm, 'sineIn')
			end
		end
	end
end
function onTweenCompleted(tag)
	if tag == 'spin0' then
		for i = 0, getProperty('strumLineNotes.length')-1 do
			noteTweenAngle('back'..i, i, 0, 0.0001)
		end
	end
end
function resetNotes()
	for i = 0, getProperty('strumLineNotes.length')-1 do
		noteTweenAngle('back'..i, i, 0, 0.0001)
	end
end
function onEvent(n, v1, v2)
	if n == 'Change Scrolltype' and coolPart then
		coolPart = false
		runTimer('scrollChangeCompleted', 0.3)
	end
end
function onTimerCompleted(tag)
	if tag == 'scrollChangeCompleted' and not coolPart then
		coolPart = true
	end
end