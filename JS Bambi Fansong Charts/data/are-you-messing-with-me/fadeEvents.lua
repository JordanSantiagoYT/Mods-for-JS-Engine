function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Are you Messing With Me?\n\nSong by JackJones1982\n\nChart by Jordan Santiago\n(Pre-SNIFFed by JJ1982)", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('oppSprite.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 2, 'linear')
end

canTwist = false
twistIntensity = 2
function onStepHit()
	if curStep == 32 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('oppSprite.alpha', 1)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 64 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 160 or curStep == 416 or curStep == 544 or curStep == 672 or curStep == 800 or curStep == 936 or curStep == 1184 then canTwist = true end
	if curStep == 400 or curStep == 528 or curStep == 656 or curStep == 790 or curStep == 912 or curStep == 1040 or curStep == 1312 then canTwist = false end
	if curStep == 408 or curStep == 412 or curStep == 536 or curStep == 540 or curStep == 920 or curStep == 924 or curStep == 1048 or curStep == 1052 then
		setProperty('camTwistIntensity', twistIntensity)
		setProperty('camTwistIntensity2', twistIntensity)
		runHaxeCode('game.doTwist();')
	end
	if curStep == 1056 or curStep == 1184 or curStep == 1312 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 1344 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenAlpha('fadeOut', 'flash', 1, 0.001, 'linear')
	end
end

function onBeatHit()
	if canTwist and curBeat % 2 == 1 then
		setProperty('camTwistIntensity', twistIntensity)
		setProperty('camTwistIntensity2', twistIntensity)
		runHaxeCode('game.doTwist();')
	end
end