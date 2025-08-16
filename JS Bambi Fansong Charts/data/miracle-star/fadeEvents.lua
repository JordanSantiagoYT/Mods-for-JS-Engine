function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Miracle Star\n\nSong by Airsew\n\nChart by Jordan Santiago\n\nBased off that Chinese Gumball ripoff.", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flashOut', 'flash', 0, 7, 'linear')
end

function onStepHit()
	if curStep == 1008 or curStep == 1016 or curStep == 8176 or curStep == 8184 then
		setProperty('flash.alpha', 0)
		doTweenAlpha('flashIn', 'flash', 1, 0.26, 'linear')
	end
	if curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 1152 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep >= 3056 and curStep < 3072 and curStep % 4 == 0 then
		setProperty('flash.alpha', 0)
		doTweenAlpha('flashIn', 'flash', 1, 0.13, 'linear')
	end
	if curStep == 3072 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 8192 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
	end
end