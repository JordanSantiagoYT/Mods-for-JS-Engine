function onCreatePost()
	makeLuaText('Credits', "Physically Unbound\n\nSong by JackJones1982\n\nChart by Jordan Santiago\n\nOpponent Sprites by TofpFL", 1250, 0, 720)
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
	doTweenAlpha('flTw', 'flash', 0, 30, 'linear')
	doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
end

function onStepHit()
	if curStep == 1952 then
		doTweenY('creditTween', 'Credits', -360, 1.3, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.3, 'linear')
	end
	if curStep == 6080 or curStep == 10176 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fadeIn', 'flash', 0.975, 0.7, 'linear')
	end
	if curStep == 6128 or curStep == 10224 then
		doTweenAlpha('fadeOut', 'flash', 0, 0.23, 'linear')
	end
	if curStep == 11232 or curStep == 11248 then
		setProperty('flash.alpha', 0)
		doTweenAlpha('fadeIn', 'flash', 0.975, 0.23, 'linear')
	end
	if curStep == 11264 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 13376 then
		setObjectCamera('flash', 'camHUD')
		doTweenAlpha('byeLol', 'flash', 1, 0.96, 'linear')
	end
end