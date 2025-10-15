function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Beauty\n\nSong by EmperorBaron\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 4, 'linear')
end

canTwist = false
twistIntensity = 1
function onStepHit()
	if curStep == 64 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, (240/curBpm) * 1.5, 'expoOut')
	end
	if curStep == 96 then
		doTweenY('creditTween', 'Credits', -420, (180/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (180/curBpm), 'linear')
	end
	if curStep == 128 or curStep == 896 then
		canTwist = true
		twistIntensity = 1
	end
	if curStep == 960 then
		twistIntensity = 2
	end
	if curStep == 438 or curStep == 1208 then
		canTwist = false
	end
	if curStep == 1728 then
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