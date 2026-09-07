function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "User\n\nSong by 18hera\n\nChart by Jordan Santiago", 1250, 0, 740)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('camHUD.alpha', 0.001)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 3.6, 'linear')
end
function onStepHit()
	if curStep == 60 then
		setProperty('flash.alpha', 1)
	end
	if curStep == 64 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('camHUD.alpha', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep > 64 and getProperty('camHUD.alpha') < 1 then
		setProperty('camHUD.alpha', 1)
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', 280, (240/curBpm), 'expoOut')
	end
	if curStep == 384 then
		doTweenY('creditTween', 'Credits', -480, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1088 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 1760 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 6, 'linear')
	end
end