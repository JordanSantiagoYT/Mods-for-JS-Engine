function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Polydirectional Maze\n\nSong and Sprites by Dxrk Pxwer\n\nChart by Jordan Santiago\n\n", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	addChromaticAbberationEffect('camHUD', 0.002)
	addChromaticAbberationEffect('camGame', 0.002)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 240, 2, 'expoOut')
	doTweenAlpha('introFade', 'flash', 0, 14, 'linear')
end

function onStepHit()
	if curStep == 472 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 960 then
		doTweenAlpha('fadeIn', 'flash', 0.9, 0.89, 'linear')
	end
	if curStep == 992 then
		doTweenAlpha('fadeOut', 'flash', 0, 0.89, 'expoIn')
	end
	if curStep == 1984 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fadeIn2', 'flash', 1, 1.6, 'linear')
	end
	if curStep == 2048 or curStep == 5120 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setObjectCamera('flash', 'camOther')
	end
	if curStep == 3584 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 5056 or curStep == 6080 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fadeIn3', 'flash', 0.9, 1.33, 'linear')
	end
	if curStep == 5104 or curStep == 6128 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fadeOut2', 'flash', 0, 0.44, 'linear')
	end
	if curStep == 7680 then
		doTweenAlpha('okBye', 'flash', 1, 3.55, 'linear')
	end
end

function onBeatHit()
	if curBeat >= 384 and curBeat <= 512 or curBeat >= 768 and curBeat <= 896 or curBeat >= 1152 and curBeat <= 1248 then
		if curBeat % 8 == 4 then
			setProperty('camTwistIntensity', 4)
			setProperty('camTwistIntensity2', 4)
			runHaxeCode('game.doTwist();')
		end
	end
end