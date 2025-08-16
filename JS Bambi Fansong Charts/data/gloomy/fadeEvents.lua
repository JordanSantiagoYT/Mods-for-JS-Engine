lyrics = {'TOLONGIT DIT...', 'G*BLOK!'}
ogDadY = 0
function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Gloomy\n\nSong by DendyGamer Covers\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	for i=1, 2 do
		makeLuaText('lyr'..i, lyrics[i], 1600, 0, 0);
		scaleObject('lyr'..i, 1, 1)
		setTextSize('lyr'..i, 120)
		setTextFont('lyr'..i, 'unispace.ttf')
		addLuaText('lyr'..i);
		setObjectCamera('lyr'..i, 'camHUD')
		screenCenter('lyr'..i)
		setProperty('lyr'..i..'.alpha', 0)
	end
	ogDadY = getProperty('oppSprite.y')
	setProperty('oppSprite.y', -1200)
end

function onSongStart()
	setProperty('camZoomingDecay', 2)
	doTweenAlpha('flTw', 'flash', 0, 14, 'linear')
end

lyricSteps = {2048, 2096}
function onStepHit()
	if curStep == 384 then
		doTweenY('dadComes', 'oppSprite', ogDadY, 5, 'expoOut')
	end
	if curStep == 512 then
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 0)
		setProperty('oppSprite.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 260, 2, 'expoOut')
	end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1536 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 3584 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 2112 then
		setProperty('lyr2.alpha', 0)
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 2624 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('dadGone', 'oppSprite', -1200, 5, 'expoIn')
		setObjectCamera('flash', 'camOther')
	end
	if curStep == 2816 then
		doTweenAlpha('okBye', 'flash', 1, 7, 'linear')
	end

	for i = 0, #lyricSteps do
		if curStep == lyricSteps[i] then
			setProperty('flash.alpha', 0.5)
			setProperty('lyr'..i..'.alpha', 1)
			if i > 0 then
				prev = i-1
				setProperty('lyr'..prev..'.alpha', 0)
			end
			break
		end
	end

	if curStep > 2112 and curStep < 2624 then
		if curStep % 16 == 8 or curStep % 16 == 12 or curStep % 16 == 14 then
			triggerEvent('Add Camera Zoom', '0.06', '0.12')
		end
	end
end

function onBeatHit()
	if (curBeat > 256 and curBeat < 320 or curBeat > 384 and curBeat < 512) and curBeat % 4 == 2 then
		setProperty('camTwistIntensity', 4)
		setProperty('camTwistIntensity2', 4)
		runHaxeCode('game.doTwist();')
	end
end