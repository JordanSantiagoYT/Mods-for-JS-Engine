function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Attaquant\n\nSong by NeneBoom/Zust\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaText('otherCreds','Oppo Sprites by Enzo Polis',1200,30,800)
    	setTextSize('otherCreds', 32)
    	addLuaText('otherCreds')
	screenCenter('otherCreds', 'X')

	setProperty('camZoomingDecay', 2)
	setProperty('camZooming', true)
end

function onSongStart()
	doTweenAlpha('fadeIn', 'flash', 0.8, (220/curBpm), 'linear')
end

function onStepHit()
	if curStep == 16 then
   	     	cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 48 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 272 or curStep == 1808 then
		doTweenY('NewCreditTween', 'otherCreds', 560, (240/curBpm), 'expoOut')
	end
	if curStep == 304 or curStep == 1840 then
		doTweenY('NewCreditTween', 'otherCreds', 800, (240/curBpm), 'expoIn')
	end
	if curStep == 1776 then
   	     	cameraFlash('camOther', 'FF0000', 0.7)
		setProperty('flash.alpha', 1)
	end
	if curStep == 1808 then
   	     	cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
    		setTextString('otherCreds', "Phonophobia Expunged Sprites by TheTrueAccount_2")
		screenCenter('otherCreds', 'X')
	end
	if curStep == 2320 then
		doTweenAlpha('fadeIn2', 'flash', 1, 0.7, 'expoIn')
	end
	if curStep == 2384 then
		doTweenAlpha('fadeOut', 'flash', 0, (240/curBpm) * 8, 'expoIn')
	end
	if curStep == 2640 then
   	     	cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 3168 then
   	     	cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
	end
end