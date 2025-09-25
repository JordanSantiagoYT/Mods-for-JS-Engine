function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Shucks\n\nSong by TGWA_Zach\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 16, 'linear')
end

function onStepHit()
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 304 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep == 512 or curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 768 or curStep == 1536 then
		doTweenAlpha('fade1', 'flash', 0.6, (30/curBpm), 'linear')
	end
	if curStep == 896 or curStep == 1664 then
		doTweenAlpha('fadeOut1', 'flash', 0, (240/curBpm) * 7, 'linear')
	end
	if curStep == 1984 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 4)
	end
end