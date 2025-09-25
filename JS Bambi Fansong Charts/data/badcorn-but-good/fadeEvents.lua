function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Badcorn but Good\n\nSong by FlipsterMusic\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm), 'linear')
end

canTwist = false
twistIntensity = 2
function onStepHit()
	if curStep == 16 then
		canTwist = true
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 48 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep == 140 or curStep == 656 then
		cameraFade('camOther', 'ffffff', (50/curBpm), false, false)
	end
	if curStep == 144 or curStep == 660 then
		twistIntensity = 4
		cameraFade('camOther', 'ffffff', (50/curBpm), false, true)
	end
	if curStep == 384 or curStep == 624 or curStep == 912 then
		canTwist = false
	end
	if curStep == 528 or curStep == 660 then
		canTwist = true
	end
	if curStep == 624 then
		doTweenX('toBamb', 'camFollow', 400, 2, 'quartInOut')
		doTweenY('toBamb2', 'camFollow', 660, 2, 'quartInOut')
	end
	if curStep == 912 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm))
	end
end

function onBeatHit()
	if canTwist and curBeat % 2 == 1 then
		setProperty('camTwistIntensity', twistIntensity)
		setProperty('camTwistIntensity2', twistIntensity)
		runHaxeCode('game.doTwist();')
	end
end