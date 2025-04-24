function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "OG\n\nSong by AadstaPinwheel\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 15, 'linear')
end

function onStepHit()
	if curStep == 128 then
		doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
	end
	if curStep == 160 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 256 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
	end
	if curStep == 896 or curStep == 1728 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setProperty('flash.alpha', 1)
	end
	if curStep == 960 then
		doTweenAlpha('flTw', 'flash', 0, 8, 'linear')
	end
	if curStep == 2560 then
		doTweenAlpha('fadeOut', 'flash', 1, 15.7, 'linear')
	end
	if curStep >= 128 and curStep <= 568 or curStep >= 576 and curStep < 632 or curStep >= 640 and curStep < 896 or curStep >= 1088 and curStep <= 1152 then
		if curStep % 16 == 4 or curStep % 16 == 6 or curStep % 16 == 10 or curStep % 16 == 12 then
			triggerEvent('Add Camera Zoom', 0.03, 0.06)
		end
	end
	if curStep >= 1152 and curStep < 1660 then
		if curStep % 4 == 2 then
			setProperty('camTwistIntensity', 4)
			setProperty('camTwistIntensity2', 4)
			runHaxeCode('game.doTwist();')
			triggerEvent('Add Camera Zoom', 0.03, 0.06)
		end
	end
end

function onBeatHit()
	if curBeat >= 64 and curBeat <= 142 and curBeat >= 144 and curBeat < 158 and curBeat >= 160 and curBeat < 224 or curBeat > 272 and curBeat <= 288 then
		if curBeat % 2 == 1 then
			setProperty('camTwistIntensity', 4)
			setProperty('camTwistIntensity2', 4)
			runHaxeCode('game.doTwist();')
		end
	end
end