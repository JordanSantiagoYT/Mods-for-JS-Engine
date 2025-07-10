local anchorpos = {};

function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Syndrome\n\nSong by Kasper\n\nChart by Jordan Santiago\n\nSprites by Null_y34r", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

        for i = 0,7 do 
            xJump = getPropertyFromGroup('strumLineNotes', i, 'x')
            yJump = getPropertyFromGroup('strumLineNotes', i, 'y')
            table.insert(anchorpos, {xJump,yJump})
        end
end

function onStepHit()
	if curStep == 256 then
		doTweenAlpha('flTw', 'flash', 0, 12, 'linear')
	end
	if curStep == 512 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1016 then
		doTweenAlpha('okBye', 'flash', 1, 0.35, 'linear')
	end
	if curStep == 1024 or curStep == 1280 or curStep == 2592 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 1279 or curStep == 2591 then --we enable it the step before because its funny
		coolPart = true
	end
	if curStep == 1528 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('okBye', 'flash', 1, 0.35, 'linear')
	end
	if curStep == 1535 or curStep == 2847 then coolPart = false end
	if curStep == 1536 then
		doTweenAlpha('evilFade', 'flash', 0, 0.9, 'linear')
	end
	if curStep == 2912 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('okBye', 'flash', 1, 1.3, 'linear')
	end
end

function onBeatHit()
	if curBeat > 128 and curBeat < 384 or curBeat > 448 and curBeat < 712 then
		if curBeat % 4 == 2 then
			for i = 0, 7 do
				noteTweenAngle('spin'..i, i, 360, 230 / curBpm, 'expoOut')
			end
		end
	end
	if coolPart then
		if curBeat % 2 == 0 then
			for i = 0, 7 do
				noteTweenY('noteJump'..i, i, anchorpos[i+1][2] - 30, 60 / curBpm, 'sineOut')
			end
		end
		if curBeat % 2 == 1 then
			for i = 0, 7 do
				noteTweenY('noteFall'..i, i, anchorpos[i+1][2], 60 / curBpm, 'sineIn')
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