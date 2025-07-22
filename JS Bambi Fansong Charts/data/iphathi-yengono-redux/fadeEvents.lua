function onCreate()
	setProperty('skipArrowStartTween', true)
end
function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "IPHATHI YENGONO (Redux)\n\nSong by ourplebop\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('dad.alpha', 0)


end

function onSongStart()
	setProperty('camZoomingDecay', 2)
	doTweenAlpha('flTw', 'flash', 0, 14, 'linear')
	noteTweenX('byeNote1', 0, -140, 0.01, 'linear');
        noteTweenX('byeNote2', 1, -140, 0.01, 'linear');
       	noteTweenX('byeNote3', 2, -140, 0.01, 'linear');
        noteTweenX('byeNote4', 3, -140, 0.01, 'linear');
	noteTweenX('bfStrumX', 4, 415, 0.01, 'quartInOut')
	noteTweenX('bfStrumX1', 5, 525, 0.01, 'quartInOut')
	noteTweenX('bfStrumX2', 6, 635, 0.01, 'quartInOut')
	noteTweenX('bfStrumX3', 7, 745, 0.01, 'quartInOut')
end

function onStepHit()
	if curStep == 768 or curStep == 6656 then
		doTweenAlpha('heComes', 'nipplePartyGuy', 0.5, 7, 'linear')
	end
	if curStep >= 1024 and curStep <= 1032 or curStep >= 6912 and curStep <= 6920 then
		setProperty('nipplePartyGuy.alpha', 1)
	end
	if curStep >= 1024 and curStep <= 1026 then
		doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
	end
	if curStep >= 1536 and curStep <= 1544 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep >= 3088 and curStep < 3104 then
		setProperty('nipplePartyGuy.alpha', 0)
	end
	if curStep == 4848 then
		doTweenAlpha('bgFade1', 'bg', 1, 1) --yeah i found out you cant fade shaders like this one out
	end
	if curStep == 6400 then setProperty('bg.alpha', 0) end
	if curStep == 6464 then setProperty('bg.alpha', 1) end
	if curStep == 23296 then
		setProperty('nipplePartyGuy.alpha', 0)
	end
	if curStep == 23808 then
		setProperty('flash.alpha', 1)
	end

	--flashing and other stuff
	if curStep == 1024 or curStep == 3088 or curStep == 5872 or curStep == 6464 or curStep == 6912 or curStep == 23296 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
end

function onBeatHit()
	if curBeat > 192 and curBeat < 244 or curBeat >= 832 and curBeat < 1084 or curBeat > 1092 and curBeat < 1212 or curBeat > 1468 and curBeat < 1600 or curBeat > 1616 and curBeat < 1728 then
		if curBeat % 8 == (curBeat > 832 and curBeat < 1500 and 0 or 4) then
			setProperty('camTwistIntensity', 4)
			setProperty('camTwistIntensity2', 4)
			runHaxeCode('game.doTwist();')
			for i = 0, getProperty('strumLineNotes.length')-1 do
				noteTweenAngle('spin'..i, i, 360, 400 / curBpm, 'expoOut')
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