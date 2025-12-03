local anchorpos = {};

function onCreatePost()
        for i = 0,getProperty('strumLineNotes.length')-1 do 
            xJump = getPropertyFromGroup('strumLineNotes', i, 'x')
            yJump = getPropertyFromGroup('strumLineNotes', i, 'y')
            table.insert(anchorpos, {xJump,yJump})
        end
end

noteTwist = false
function onBeatHit()
	if curBeat >= 32 and curBeat < 87 then
		if curBeat % 2 == 0 then
			noteTwist = not noteTwist
			for i = 0, getProperty('strumLineNotes.length') - 1 do
				noteTweenAngle('twist'..i, i, (noteTwist and 15 or -15), 100 / curBpm, 'expoOut')
			end
		end
	end
	if curBeat == 88 then
		for i = 0, getProperty('strumLineNotes.length') - 1 do
			noteTweenAngle('backNormal'..i, i, 0, 240 / curBpm, 'expoOut')
		end
	end
	if curBeat == 96 or curBeat == 512 then coolPart = true end
	if curBeat == 160 or curBeat == 576 then coolPart = false end
	if curBeat > 96 and curBeat < 288 or curBeat > 416 and curBeat < 480 or curBeat > 512 and curBeat < 624 then
		if curBeat % 4 == 2 then
			for i = 0, 7 do
				noteTweenAngle('spin'..i, i, 360, 230 / curBpm, 'expoOut')
			end
		end
	end
	if curBeat > 384 and curBeat < 412 or curBeat > 416 and curBeat < 480 then
		if curBeat % 2 == 0 then
			for i = 0, 7 do
				noteTweenScaleX('bigN'..i..'X', i, 1.2, 0.01, 'expoOut')
				noteTweenScaleY('bigN'..i..'Y', i, 1.2, 0.01, 'expoOut')
				noteTweenScaleX('backN'..i..'X', i, 1, (100/curBpm), 'expoOut')
				noteTweenScaleY('backN'..i..'Y', i, 1, (100/curBpm), 'expoOut')
			end
		end
	end
	if coolPart then
		if curBeat % 2 == 0 then
			for i = 0, getProperty('strumLineNotes.length') - 1 do
				noteTweenY('noteJump'..i, i, anchorpos[i+1][2] - 30, 60 / curBpm, 'sineOut')
			end
		end
		if curBeat % 2 == 1 then
			for i = 0, getProperty('strumLineNotes.length') - 1 do
				noteTweenY('noteFall'..i, i, anchorpos[i+1][2], 60 / curBpm, 'sineIn')
			end
		end
	end
	if curBeat > 656 and curBeat < 752 and curBeat % 3 == 2 then
		setProperty('camTwistIntensity', 4)
		setProperty('camTwistIntensity2', 4)
		runHaxeCode('game.doTwist();')
		triggerEvent('Add Camera Zoom', '0.03', '0.06')
	end
end
function onTweenCompleted(tag)
	if tag == 'spin0' then
		for i = 0, getProperty('strumLineNotes.length')-1 do
			noteTweenAngle('back'..i, i, 0, 0.0001)
		end
	end
end