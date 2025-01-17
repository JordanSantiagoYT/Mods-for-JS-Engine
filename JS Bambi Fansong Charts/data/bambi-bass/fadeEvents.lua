function onCreatePost()
	makeLuaText('Credits', "Bambi Bass\n\nSong by Biddle3\n\nChart by Jordan Santiago", 1250, 0, 720)
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
	doTweenAlpha('flTw', 'flash', 0, 11, 'linear')
	doTweenY('creditTween', 'Credits', 300, 2, 'expoOut')
end

function onStepHit()
	if curStep == 116 then
		doTweenY('creditTween', 'Credits', -360, 1.1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.1, 'linear')
	end
	if curStep == 3584 then
		cameraFlash('camOther', 'FFFFFF', 0.8)
		setProperty('flash.alpha', 1)
	end
end