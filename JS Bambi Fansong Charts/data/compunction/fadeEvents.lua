function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Compunction\n\nSong by Myraxi\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 36)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 16, 'linear')
end

function onStepHit()
	if curStep >= 496 and curStep < 504 then
		if curStep % 2 == 0 then
			setProperty('flash.alpha', 0)
			doTweenAlpha('fude', 'flash', 1, (24/curBpm), 'linear')
		end
	end
	if curStep >= 504 and curStep < 512 then
		if curStep % 4 == 0 then
			setProperty('flash.alpha', 0)
			doTweenAlpha('fude', 'flash', 1, (50/curBpm), 'linear')
		end
	end
	if curStep == 512 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, (480/curBpm), 'expoOut')
	end
	if curStep == 608 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 760 then
		doTweenAlpha('ah', 'flash', 1, (110/curBpm), 'linear')
	end
	if curStep == 768 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 2560 then
		setProperty('flash.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 2816 then
		doTweenAlpha('fadeBack', 'flash', 0, (240/curBpm) * 12, 'linear')
	end
	if curStep == 3328 then
		cameraFlash('camOther', 'ffffff', 0.7)
		addGrayscaleEffect('camHUD')
		addGrayscaleEffect('camGame')
	end
	if curStep == 3584 then
		cameraFlash('camOther', 'ffffff', 0.7)
		clearEffects('camHUD')
		clearEffects('camGame')
	end
	if curStep == 4352 then
		cameraFlash('camOther', 'ffffff', 0.7)
		addGrayscaleEffect('camHUD')
		addGrayscaleEffect('camGame')
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 17.2, 'linear')
	end
	if curStep == 4632 then
		clearEffects('camHUD')
		clearEffects('camGame')
	end
end