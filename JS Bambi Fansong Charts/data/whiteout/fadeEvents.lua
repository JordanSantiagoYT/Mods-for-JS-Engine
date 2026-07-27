function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Whiteout\n\nSong by Serde\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	makeLuaSprite('appleBG', '', 0, 0);
	makeGraphic('appleBG', 1, 1, 'FFFFFF')
	addLuaSprite('appleBG', true);
	setLuaSpriteScrollFactor('appleBG', 0, 0)
	setProperty('appleBG.scale.x', 3840)
	setProperty('appleBG.scale.y', 2160)
	setProperty('appleBG.alpha', 0)
	setObjectOrder('appleBG', getObjectOrder('dadGroup'))

	setProperty('camZoomingDecay', 2.5)
	setProperty('ytWatermark.alpha', 0)

	initLuaShader('BlackAndWhite')
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 16, 'linear')
end
function onStepHit()
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 288 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 640 or curStep == 1280 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('appleBG.alpha', 1)
		setProperty('dadGroup.color', '000000')
		setProperty('boyfriendGroup.color', '000000')
		addGrayscaleEffect('camHUD')
	end
	if curStep == 896 or curStep == 1408 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('appleBG.alpha', 0)
		setProperty('dadGroup.color', getColorFromHex('FFFFFF'))
		setProperty('boyfriendGroup.color', getColorFromHex('FFFFFF'))
		clearEffects('camHUD')
	end
	if curStep == 1408 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
end