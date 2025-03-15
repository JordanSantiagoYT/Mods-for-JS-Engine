function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 90)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "BANGERLIOSIS (REMAKE)\n\nSong by bamb1_lol970\n\nChart by Jordan Santiago\n\nBANGERLIOSIS Sprites by TheTrueAccount_2 and DIMON4IK\n\nCustom BF sprites by SuperDuperBlue", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaText('flashWarn', "FLASHING WARNING!!!", 1250, 0, 720)
	setTextAlignment('flashWarn', 'Center')
	addLuaText('flashWarn')
	setTextSize('flashWarn', 40)
	setObjectCamera('flashWarn', 'camOther')
	setTextBorder('flashWarn', 3, '000000')

	makeLuaSprite('redVig', 'redvignette', 0, 0);
	addLuaSprite('redVig', true);
	setLuaSpriteScrollFactor('redVig', 0, 0)
	setProperty('redVig.alpha', 0)
	setObjectCamera('redVig', 'camHUD')

	makeLuaSprite('whiteBG', '', 0, 0)
 	makeGraphic('whiteBG', screenWidth, screenHeight, 'FFFFFF')
 	setObjectOrder('whiteBG', getObjectOrder('bgNormal') + 1)
  	addLuaSprite('whiteBG', true)
  	setLuaSpriteScrollFactor('whiteBG', 0, 0)
   	setProperty('whiteBG.scale.x', 3)
  	setProperty('whiteBG.scale.y', 3)
  	setProperty('whiteBG.alpha', 0)
  	setObjectCamera('whiteBG', 'camGame')
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 240, 2, 'expoOut')
end

function onStepHit()
	setProperty('camZoomingDecay', 4 / (getProperty('camBopInterval')))
	if curStep == 32 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setProperty('Credits.alpha', 0)
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 272 then
		doTweenAlpha('eviloppfade', 'dad', 0, 0.65, 'linear')
		doTweenAlpha('bgBye', 'bgNormal', 0, 0.65, 'linear')
	end
	if curStep == 288 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('dad.alpha', 1)
		setProperty('bgNormal.alpha', 1)
	end
	if curStep == 1040 then
		doTweenY('warnIn', 'flashWarn', 340, 0.8, 'expoOut')
	end
	if curStep == 1056 then
		setObjectCamera('flash', 'camGame')
		doTweenY('byeWarn', 'flashWarn', -720, 0.4, 'expoIn')
	end
	if curStep >= 1056 and curStep < 1568 then
		if curStep % 4 == 0 then
			setProperty('flash.alpha', 0)
			setProperty('redVig.alpha', 1)
			doTweenAlpha('vigOut', 'redVig', 0, 0.15, 'linear')
		end
		if curStep % 4 == 2 and curStep <= 1312 then
			setProperty('flash.alpha', 1)
		end
	end
	if curStep == 1568 then
		doTweenAlpha('fakeIn', 'flash', 1, 1.14, 'linear')
		doTweenAlpha('fakeHUDBye', 'camHUD', 0, 1.14, 'linear')
	end
	if curStep == 1592 then
		doTweenAlpha('HUDback', 'camHUD', 1, 0.4, 'linear')
		setProperty('dad.alpha', 0)
		setProperty('bg.alpha', 0)
		setProperty('whiteBG.alpha', 1)
	end
	if curStep == 1600 then
		doTweenAlpha('goBack', 'flash', 0, 31, 'linear')
		setProperty('boyfriend.color', 000000)
	end
	if curStep == 2048 then
		doTweenAlpha('LOL', 'flash', 1, 1.14, 'linear')
		doTweenAlpha('LOL2', 'camHUD', 0, 1.14, 'linear')
	end
	if curStep == 2080 then
		doTweenAlpha('hiHUD', 'camHUD', 1, 0.7, 'linear')
		setProperty('boyfriend.color', getColorFromHex('ffffff'))
	end
	if curStep == 2112 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setProperty('dad.alpha', 1)
		setProperty('bgAlt.visible', true)
		setProperty('whiteBG.alpha', 0)
		doTweenColor('boyfriendColorTween', 'boyfriend', '0xffFF9999', 0.01, 'quadInOut')
	end
	if curStep == 2656 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('trueBye', 'flash', 1, 0.6, 'linear')
	end
end