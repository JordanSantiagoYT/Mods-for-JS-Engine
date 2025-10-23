function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Rivalrous\n\nSong by Seriously_2212\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0.7, (240/curBpm) * 31, 'linear')
end

function onStepHit()
	if curStep == 496 then
		doTweenAlpha('flTw2', 'flash', 1, (180/curBpm), 'linear')
	end
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep == 1344 then
		doTweenAlpha('fadeOut1', 'flash', 0.5, (240/curBpm) * 11)
	end
	if curStep == 1536 then
		setProperty('flash.alpha', 0.2)
		doTweenAlpha('fadeOut2', 'flash', 0.9, (240/curBpm) * 31.6)
	end
	if curStep == 2048 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 2880 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 12)
	end
end