function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Placeholder Invasion\n\nSong by SuperScratchSpyro\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 14, 'linear')
end

function onStepHit()
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 498 or curStep == 502 or curStep == 505 or curStep == 507 or curStep == 509 or curStep == 511 then
		setProperty('flash.alpha', 1)
	end
	if curStep == 500 or curStep == 504 or curStep == 506 or curStep == 508 or curStep == 510 then
		setProperty('flash.alpha', 0)
	end
	if curStep == 512 or curStep == 1280 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 752 then
		doTweenAlpha('flIn', 'flash', 1, 0.56, 'linear')
	end
	if curStep == 760 then
		doTweenAlpha('flIn', 'flash', 0, 0.56, 'linear')
	end
	if curStep == 1792 then
		doTweenAlpha('okBye', 'flash', 1, 18.6, 'linear')
	end
end