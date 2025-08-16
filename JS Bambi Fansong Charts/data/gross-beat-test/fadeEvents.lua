function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Gross Beat Test\n\nSong by Airsew\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flashOut', 'flash', 0, 13, 'linear')
end

function onStepHit()
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1472 or curStep == 2256 then
		doTweenAlpha('flashOut2', 'flash', 0.8, (240/curBpm) * 3, 'linear')
	end
	if curStep == 1528 then
		doTweenAlpha('flashOut3', 'flash', 0, (120/curBpm), 'linear')
	end
	if curStep == 2304 then
		doTweenAlpha('flashOut4', 'flash', 0, (240/curBpm), 'linear')
	end
	if curStep == 4608 then
		doTweenAlpha('flashOut5', 'flash', 1, (240/curBpm) * 4, 'linear')
	end
end