function onCreatePost()
	makeLuaText('Credits', "Eclipse (Hellbreaker Part)\n\nSong by Pyxlmated\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

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
	if curStep == 1008 then
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 1)
	end
	if curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 1)
		setObjectCamera('flash', 'camHUD')
		setProperty('flash.alpha', 0)
	end
	if curStep == 7680 then
		doTweenAlpha('Byebye', 'flash', 1, 14.7, 'linear')
	end
end