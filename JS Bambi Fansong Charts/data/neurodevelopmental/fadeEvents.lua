function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Neurodevelopmental\n\nSong by 18hera - cfwc\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 25, 'linear')
end

function onStepHit()
	if curStep == 240 or curStep == 496 or curStep == 752 or curStep == 1008 then
		doTweenAlpha('flashIn', 'flash', 0.9, 1.67, 'linear')
	end
	if curStep == 255 or curStep == 511 or curStep == 767 or curStep == 1023 then
		doTweenAlpha('flashIn', 'flash', 0, 0.1, 'linear')
	end
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 288 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1472 then
		doTweenAlpha('fadeOut', 'flash', 1, 7.8, 'linear')
	end
end