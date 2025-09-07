function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Yard\n\nSong by joolieiscool\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 11, 'linear')
end

function onStepHit()
	if curStep == 128 then
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 192 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep == 1280 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 1)
		doTweenAlpha('byeHUD', 'camHUD', 0.001, 0.75)
	end
	if curStep == 1288 then setObjectCamera('flash', 'camOther') end
end