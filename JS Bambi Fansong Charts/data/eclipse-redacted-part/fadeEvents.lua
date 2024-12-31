function onCreatePost()
	makeLuaText('Credits', "Eclipse (REDACTED's Part)\n\nSong by Pyxlmated\n\nChart by Jordan Santiago\n\nREDACTED Sprites by orien", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

    	dadPositionY = getProperty("dad.y")
	setProperty('dad.y', -1200)

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camHUD')
end

function onSongStart()
	doTweenAlpha('fadeOut', 'flash', 0, 28.4, 'linear')
	doTweenY('creditTween', 'Credits', 300, 2, 'expoOut')
end

function onStepHit()
	if curStep == 992 then
		doTweenY('creditTween', 'Credits', -360, 0.9, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.9, 'linear')
	end
	if curStep == 1024 then
		doTweenY('opponentComes', 'dad', dadPositionY, 1.6, 'expoOut')
	end
	if curStep == 1088 or curStep == 4160 then
		cameraFlash('camOther', 'ffffff', 1)
		setObjectCamera('flash', 'camHUD')
		setProperty('flash.alpha', 0)
	end
	if curStep == 7296 then
		cameraFlash('camOther', 'ffffff', 4)
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 1)
	end
end