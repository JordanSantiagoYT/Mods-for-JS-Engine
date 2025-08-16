function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Amphotericity\n\nSong by DendyGamer Covers\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	for i=1, 4 do
		makeLuaSprite('lyr'..i, 'gena/lyr '..i, 0, 0);
		scaleObject('lyr'..i, 0.6, 0.6)
		addLuaSprite('lyr'..i, true);
		setObjectCamera('lyr'..i, 'camHUD')
		screenCenter('lyr'..i)
		setProperty('lyr'..i..'.alpha', 0)
	end

	makeLuaText('concentration', "Concentration of Knowledge: ?", 2560, -1080, 0)
	addLuaText('concentration')
	setTextSize('concentration', 120)
	setObjectCamera('concentration', 'camGame')
	setObjectOrder('concentration', 1)
	setTextFont('concentration', 'digital-7.ttf')
	--setTextBorder('concentration', 3, '000000')
	setProperty('oppSprite.alpha', 0)
end

function onSongStart()
	setProperty('camZoomingDecay', 2)
	doTweenAlpha('flTw', 'flash', 0.6, 14, 'linear')
end

lyricSteps = {465, 485, 4736, 4777}
function onStepHit()
	if curStep == 384 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setObjectCamera('flash', 'camGame')
	end
	if curStep == 512 then
		setProperty('lyr2.alpha', 0)
		setProperty('flash.alpha', 0)
		setProperty('oppSprite.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 260, 2, 'expoOut')
		setTextString('concentration', 'Concentration of Knowledge: 10%')
	end
	if curStep == 640 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1536 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setTextString('concentration', 'Concentration of Knowledge: 25%')
	end
	if curStep == 3584 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setTextString('concentration', 'Concentration of Knowledge: 10%')
	end
	if curStep == 4800 then
		setProperty('lyr4.alpha', 0)
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		setTextString('concentration', 'Concentration of Knowledge: 60%')
	end
	if curStep == 6336 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setTextString('concentration', 'Concentration of Knowledge: 10%')
		setObjectCamera('flash', 'camOther')
	end
	if curStep == 7488 then
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
end