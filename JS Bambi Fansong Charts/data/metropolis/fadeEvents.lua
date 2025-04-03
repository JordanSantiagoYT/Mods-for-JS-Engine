function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "METROPOLIS (Multicorn 378382783872873)\n\nSong by TimeLaserz\n\nChart by Jordan Santiago\n\nNinja by @Ninja", 1250, 0, 720)
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
	doTweenAlpha('introFade', 'flash', 0, 21, 'linear')
end

function onStepHit()
	if curStep == 480 then
		doTweenY('creditTween', 'Credits', -420, 1.3, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.3, 'linear')
	end
	if curStep == 17792 then
		doTweenAlpha('okBye', 'flash', 1, 8, 'linear')
	end
end