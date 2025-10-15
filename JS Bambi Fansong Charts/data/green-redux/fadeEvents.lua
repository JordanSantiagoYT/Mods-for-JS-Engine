function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Green (HyperDrivers REDUX)\n\nSong by HyperDrivers\n\nChart by Jordan Santiago\n\nOpponent Sprites by Enzo Polis", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaSprite('greenVig', 'greenvignette', 0, 0);
	addLuaSprite('greenVig', true);
	setLuaSpriteScrollFactor('greenVig', 0, 0)
	setProperty('greenVig.alpha', 0)
	setObjectCamera('greenVig', 'camOther')

	initLuaShader('BlackAndGreen')
end

canTwist = false
function onStepHit()
	if curStep == 128 then
		doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 8, 'linear')
	end
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 260, 2, 'expoOut')
	end
	if curStep == 288 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep >= 384 and curStep < 408 or curStep >= 960 and curStep < 984 then
		if curStep % 8 == 0 then
			doTweenAlpha('backTween', 'back', 0.4, (60/curBpm), 'linear')
			doTweenAlpha('back2Tween', 'back2', 0.4, (60/curBpm), 'linear')
			doTweenZoom('camZoomThing', 'camGame', 1.1, (60/curBpm), 'expoIn')
		end
		if curStep % 8 == 4 then
			doTweenAlpha('backTween', 'back', 1, (60/curBpm), 'linear')
			doTweenAlpha('back2Tween', 'back2', 1, (60/curBpm), 'linear')
			setProperty('greenVig.alpha', 1)
			doTweenAlpha('greenVigOut', 'greenVig', 0, (60/curBpm), 'sineOut')
			doTweenZoom('camZoomThing', 'camGame', getProperty('defaultCamZoom'), (60/curBpm), 'expoOut')
		end
	end
	if curStep == 504 or curStep == 1016 then
		cameraFade('camOther', '00FF00', (110/curBpm), false, false)
	end
	if curStep == 512 or curStep == 1024 then
		greenSwap(true)
		canTwist = true
		cameraFade('camOther', '00FF00', (110/curBpm), false, true)
	end
	if curStep == 760 or curStep == 1272 then
		cameraFade('camOther', 'ffffff', (110/curBpm), false, false)
	end
	if curStep == 768 or curStep == 1280 then
		greenSwap(false)
		canTwist = false
		cameraFade('camOther', 'ffffff', (110/curBpm), false, true)
	end
	if curStep == 1408 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 2)
	end
	if curStep >= 512 and curStep < 768 then
		if curStep % 8 == 4 then
			setProperty('greenVig.alpha', 1)
			doTweenAlpha('greenVigOut', 'greenVig', 0, (90/curBpm), 'sineOut')
		end
	end
end

function onBeatHit()
	if canTwist then
		if curBeat % 2 == 1 then
			setProperty('camTwistIntensity', 4)
			setProperty('camTwistIntensity2', 4)
			runHaxeCode('game.doTwist();')
		end
	end
end

function greenSwap(toGreen)
	setProperty('back.alpha', toGreen and 0 or 1)
	setProperty('backGreen.alpha', toGreen and 1 or 0)
	setProperty('back2.alpha', toGreen and 0 or 1)
	setProperty('back2Green.alpha', toGreen and 1 or 0)
	setProperty('front.alpha', toGreen and 0 or 1)
	setProperty('frontGreen.alpha', toGreen and 1 or 0)
	if toGreen then setSpriteShader('boyfriend', 'BlackAndGreen')
	else runHaxeCode('game.boyfriend.shader = null;') end
	setShaderBool('boyfriend', 'invert', true)
end