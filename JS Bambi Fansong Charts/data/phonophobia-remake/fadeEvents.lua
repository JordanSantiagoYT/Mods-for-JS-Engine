function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Phonophobia (Remake)\n\nSong by ThatPizzaTowerFan\n\nChart by Jordan Santiago\n\nOpponent Sprites by TheTrueAccount_2", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	addChromaticAbberationEffect('camHUD', 0.002)
	addChromaticAbberationEffect('camGame', 0.002)
end
function onStepHit()
	if curStep == 256 then
		doTweenAlpha('flashIn', 'flash', 0, 14.6, 'linear')
	end
	if curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 1120 then
		doTweenY('creditTween', 'Credits', -420, 1.4, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.4, 'linear')
	end
	if curStep == 3584 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenAlpha('okBye', 'flash', 1, 2, 'linear')
	end
end