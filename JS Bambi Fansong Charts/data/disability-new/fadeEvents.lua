function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Disability (1.5)\n\nSong by SkyFactorial\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

    	doTweenColor('boyfriendColorTween', 'boyfriend', '0xff878787', 0.01, 'quadInOut')
    	doTweenColor('dadColorTween', 'dad', '0xff878787', 0.01, 'quadInOut')
    	doTweenColor('gfColorTween', 'gf','0xff878787', 0.01, 'quadInOut')
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 9.7, 'linear')
end

function onStepHit()
	if curStep == 108 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 896 then
		doTweenAlpha('bfOut', 'boyfriend', 0.2, 0.7, 'linear')
		doTweenAlpha('gfOut', 'gf', 0.2, 0.7, 'linear')
		for i = 4, 7 do
			noteTweenAlpha('strumOut'..i, i, 0, 1, 'linear')
		end
	end
	if curStep == 1016 or curStep == 1152 then
		for i = 0, 7 do
			noteTweenAlpha('strumBack'..i, i, 0.7, 0.5, 'linear')
		end
	end
	if curStep == 1024 then
		doTweenAlpha('bfOut', 'boyfriend', 1, 0.7, 'linear')
		doTweenAlpha('dadOut', 'dad', 0.2, 0.7, 'linear')
		for i = 0, 3 do
			noteTweenAlpha('strumOutLol'..i, i, 0, 0.5, 'linear')
		end
	end
	if curStep == 1152 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setProperty('gf.alpha', 1)
		doTweenAlpha('bfIn', 'boyfriend', 1, 0.7, 'linear')
		doTweenAlpha('dadIn', 'dad', 1, 0.7, 'linear')
    		doTweenColor('boyfriendColorTween', 'boyfriend', '0xff878787', 0.01, 'quadInOut')
    		doTweenColor('gfColorTween', 'gf','0xff878787', 0.01, 'quadInOut')
	end
	if curStep == 1536 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 1)
		setProperty('camHUD.alpha', 0)
	end
	if curStep == 1660 then
		doTweenAlpha('hudBack', 'camHUD', 1, 0.3, 'linear')
	end
	if curStep == 1664 or curStep == 2704 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setObjectCamera('flash', 'camOther')
		setProperty('flash.alpha', 0)
	end
	if curStep >= 2960 and curStep % 16 == 14 and curStep <= 3216 then
		triggerEvent('Add Camera Zoom')
	end
	if curStep == 3408 then
		doTweenAlpha('okBye', 'flash', 1, 10.7, 'linear')
	end
end

function onUpdate(elapsed)
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
	doTweenY('opponentmove', 'dad', 150 - 150*math.sin((currentBeat+12*12)*math.pi), 2)
	if not mustHitSection then
		cameraSetTarget('dad')
	end
end