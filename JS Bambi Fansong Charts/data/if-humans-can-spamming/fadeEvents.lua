lyrics = {'1...', '2..', '3..', '4!', "Mom it's really not...", 'Me!', 'Uh oh...'}
function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "If Humans can Spamming\n\nSong by DendyGamer Covers\n\nChart by Jordan Santiago\n\nSiowei Phase 1 Drawing by frokeni\n\nOpponent by im_siowei", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	for i=1, #lyrics do
		makeLuaText('lyr'..i, lyrics[i], 1600, 0, 0);
		scaleObject('lyr'..i, 1, 1)
		setTextSize('lyr'..i, 75)
		addLuaText('lyr'..i);
		setObjectCamera('lyr'..i, 'camHUD')
		screenCenter('lyr'..i)
		setProperty('lyr'..i..'.alpha', 0)
	end

	setProperty('oppSprite.alpha', 0)
end

function onSongStart()
	setProperty('camZoomingDecay', 2)
	doTweenAlpha('flTw', 'flash', 0.6, 27, 'linear')
end

lyricSteps = {3716, 3734, 3752, 3768, 5696, 5736, 5761}
function onStepHit()
	if curStep == 500 then
		doTweenAlpha('flTw', 'flash', 1, 0.6, 'linear')
	end
	if curStep == 512 then
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 0)
		setProperty('oppSprite.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 230, 2, 'expoOut')
	end
	if curStep == 640 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1024 or curStep == 1792 or curStep == 3200 or curStep == 3776 or curStep == 4800 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 3776 then
		setProperty('lyr4.alpha', 0)
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('oppSprite.alpha', 0)
		setProperty('oppSprite2.alpha', 1)
		addBloomEffect('camhud', 0.15)
		addBloomEffect('camgame', 0.15)
		addChromaticAbberationEffect('camhud', 0.003)
		addChromaticAbberationEffect('camgame', 0.003)
	end
	if curStep == 4800 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('oppSprite.alpha', 1)
		setProperty('oppSprite2.alpha', 0)
		clearEffects('camHUD')
		clearEffects('camGame')
	end
	if curStep == 5760 then
		doTweenAlpha('okBye', 'flash', 1, 1, 'linear')
	end
	if curStep == 5776 then
		setObjectCamera('flash', 'camOther')
		setProperty('lyr7.alpha', 0)
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