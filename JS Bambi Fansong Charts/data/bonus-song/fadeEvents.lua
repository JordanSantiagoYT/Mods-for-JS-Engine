function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Bonus Song\n\nSong by MoldyGH\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 6, 'linear')
end

canTwist = false
twistIntensity = 2
function onStepHit()
	if curStep == 192 then
		canTwist = true
	end
	if curStep == 256 then
		twistIntensity = 4
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep == 512 then
		twistIntensity = 2
	end
	if curStep == 640 then
		twistIntensity = 4
	end
	if curStep == 1024 then
		canTwist = false
	end
	if curStep == 1056 then
		doTweenAlpha('fadeOut', 'flash', 1, 10)
	end
end

function onBeatHit()
	if canTwist and curBeat % 2 == 1 then
		setProperty('camTwistIntensity', twistIntensity)
		setProperty('camTwistIntensity2', twistIntensity)
		runHaxeCode('game.doTwist();')
	end
end