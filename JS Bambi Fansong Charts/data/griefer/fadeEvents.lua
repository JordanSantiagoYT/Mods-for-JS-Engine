function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Griefer\n\nSong by DendyGamer Covers\n\nChart by Jordan Santiago\n\nBF Sprites from D&B Nullified", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('oppSprite.alpha', 0)
end

function onSongStart()
	setProperty('camZoomingDecay', 2)
	doTweenAlpha('flTw', 'flash', 0, 36, 'linear')
end

function onStepHit()
	if curStep == 1536 then
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 0)
		setProperty('oppSprite.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 230, 2, 'expoOut')
	end
	if curStep == 1728 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1024 or curStep == 5632 or curStep == 7680 or curStep == 11776 or curStep == 14336 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 5632 or curStep == 11776 then
		addBloomEffect('camhud', 0.15)
		addBloomEffect('camgame', 0.15)
		addBloomEffect('bg', 0.15)
		addChromaticAbberationEffect('camhud', 0.003)
		addChromaticAbberationEffect('camgame', 0.003)
		addGlitchEffect('bg', 2, 5, 0.1)
	end
	if curStep == 7680 or curStep == 14336 then
		clearEffects('camGame')
		clearEffects('camHUD')
		clearEffects('bg')
		addGlitchEffect('bg', 2, 5, 0.1)
	end
	if curStep == 14336 then
		doTweenAlpha('okBye', 'flash', 1, 2, 'linear')
	end
end