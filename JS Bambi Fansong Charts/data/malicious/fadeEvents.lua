function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Malicious\n\nSong by julia!\n\nChart by Jordan Santiago\n\nBF Alt Poses by ChazbillYT", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

    	makeLuaText('otherCreds','Jeremy Phase 1 Sprites by Half_Joke',1200,30,800)
    	setTextSize('otherCreds', 25)
    	addLuaText('otherCreds')
	screenCenter('otherCreds', 'X')
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 19.8, 'linear')
end

function onStepHit()
	if curStep == 248 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 256 or curStep == 896 then
		doTweenY('NewCreditTween', 'otherCreds', 560, 2, 'expoOut')
	end
	if curStep == 288 or curStep == 944 then
		doTweenY('NewCreditTween', 'otherCreds', 800, 2, 'expoIn')
	end
	if curStep == 896 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setTextString('otherCreds', 'Jeremy Phase 2 Sprites by oriiien')
		screenCenter('otherCreds', 'X')
	end
	if curStep >= 1008 and curStep < 1024 then
		if curStep % 2 == 0 then
			setProperty('flash.alpha', 0)
			setObjectCamera('flash', 'camGame')
			doTweenAlpha('fadeBounce', 'flash', 1, 0.15, 'linear')
		end
	end
	if curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 1536 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('fadeOut', 'flash', 1, 14.7, 'linear')
	end
	if curStep >= 384 and curStep <= 512 then
		if curStep % 16 == 2 or curStep % 16 == 6 then
			triggerEvent('Add Camera Zoom', 0.03, 0.06)
		end
	end
	if curStep >= 1376 and curStep <= 1392 then
		if curStep % 4 == 2 then
			triggerEvent('Add Camera Zoom', 0.03, 0.06)
		end
	end
	if curStep >= 1392 and curStep <= 1408 then
		triggerEvent('Add Camera Zoom', 0.03, 0.06)
	end
end