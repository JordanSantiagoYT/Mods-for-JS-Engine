function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Technically\n\nSong by Seriously_2212\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 300, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 26, 'linear')
end

function onStepHit()
	if curStep == 480 then
		doTweenY('creditTween', 'Credits', -420, 1.4, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.4, 'linear')
	end
	if curStep == 1008 or curStep == 1776 then
		setObjectCamera('Credits', 'camGame')
		doTweenAlpha('fadeIn', 'flash', 1, 0.41, 'linear')
	end
	if curStep == 1016 or curStep == 1784 then
		doTweenAlpha('fadeOut', 'flash', 0, 0.41, 'linear')
	end
	if curStep == 1272 or curStep == 2808 then
		doTweenAlpha('fadeIn2', 'flash', 1, 0.41, 'linear')
	end
	if curStep == 1280 or curStep == 2816 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 3584 then
		setObjectCamera('Credits', 'camOther')
		doTweenAlpha('okBye', 'flash', 1, 12, 'linear')
	end
end