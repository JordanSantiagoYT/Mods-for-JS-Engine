function onCreatePost()
	luadebugmode = true
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Fight Against The UV Light\n\nSong by JackJones1982\n\nChart by Jordan Santiago\n\n", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaSprite('jumpscare', 'microwave-jumpscare', 120, 0);
	scaleObject('jumpscare', 1, 1);
    	setScrollFactor('jumpscare', 0, 0);
	addLuaSprite('jumpscare', false);
	setObjectCamera('jumpscare', 'camOther')
	setProperty('jumpscare.alpha', 0)

    	doTweenColor('boyfriendColorTween', 'boyfriend', '0xff878787', 0.01, 'quadInOut')
    	doTweenColor('dadColorTween', 'dad', '0xff878787', 0.01, 'quadInOut')
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 4, 'linear')
end

function onStepHit()
	if curStep == 96 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 240 or curStep == 752 or curStep == 1280 then
		doTweenAlpha('fadeIn', 'flash', 1, 0.48, 'linear')
	end
	if curStep == 256 or curStep == 768 or curStep == 1296 or curStep == 1792 then
		cameraFlash('camOther', 'FFFFFF', 0.5)
		setProperty('flash.alpha', 0)
	end
	if curStep == 768 or curStep == 1296 then
		setProperty('jumpscare.alpha', 1)
		runTimer('microwaveDisappear', 0.3)
		setProperty('bf.holdTimer', 0)
		characterPlayAnim('bf', 'hurt', true);
		setProperty('bf.specialAnim', true)
	end
	if curStep == 1760 then
		doTweenAlpha('doIn', 'flash', 1, 0.99, 'linear')
	end
	if curStep == 2288 then
		doTweenAlpha('quickIn', 'flash', 1, 0.24, 'linear')
	end
	if curStep == 2296 then
		doTweenAlpha('quickOut', 'flash', 0, 0.24, 'linear')
	end
	if curStep == 2304 then
		setProperty('jumpscare.alpha', 1)
		doTweenAlpha('microwaveGoAway', 'jumpscare', 0, 0.5, 'linear')
		setProperty('bf.holdTimer', 0)
		characterPlayAnim('bf', 'hurt', true);
		setProperty('bf.specialAnim', true)
	end
	if curStep == 2784 then
		doTweenAlpha('goInAgain', 'flash', 0.9, 0.99, 'linear')
	end
	if curStep == 2816 then
		doTweenAlpha('goOut', 'flash', 0, 7.55, 'linear')
	end
	if curStep == 3072 then
		doTweenAlpha('okBye', 'flash', 1, 1.8, 'linear')
	end
end

function onBeatHit()
	if curBeat >= 192 and curBeat < 312 or curBeat >= 324 and curBeat < 440 or curBeat >= 576 and curBeat < 640 or curBeat >= 648 and curBeat < 696 then
		if curBeat % 16 == 2 or curBeat % 16 == 6 or curBeat % 32 == 11 or curBeat % 32 == 25 or curBeat % 32 == 14 then
			triggerEvent('Add Camera Zoom', 0.03, 0.06)
		end
	end
end

function onTimerCompleted(t)
	if t == 'microwaveDisappear' then
		doTweenAlpha('microwaveGoAway', 'jumpscare', 0, 0.5, 'linear')
	end
end