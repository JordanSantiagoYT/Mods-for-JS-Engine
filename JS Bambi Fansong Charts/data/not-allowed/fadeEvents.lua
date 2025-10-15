function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Not Allowed\n\nSong by Monroe14\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 32, 'linear')
end

canTwist = false
function onStepHit()
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 608 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep == 768 or curStep == 1280 or curStep == 2816 or curStep == 3584 then
		canTwist = true
	end
	if curStep == 1024 or curStep == 1518 or curStep == 3328 or curStep == 4608 then
		canTwist = false
	end
	if curStep == 3328 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
	end
	if curStep == 3456 then
		doTweenAlpha('fadeOutThing', 'flash', 0, (240/curBpm) * 8)
	end
	if curStep == 4672 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 6)
	end
end

function onBeatHit()
	if canTwist then
		if curBeat % 8 == 4 then
			setProperty('camTwistIntensity', 4)
			setProperty('camTwistIntensity2', 4)
			runHaxeCode('game.doTwist();')
		end
	end
end