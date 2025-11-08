function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Agony (Luminary Remix)\n\nSong by Luminary\nOG by Hortas\n\nChart by Jordan Santiago", 1250, 0, 720)
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
	if curStep == 252 then
		cameraFade('camOther', 'ffffff', (50/curBpm), true, false)
	end
	if curStep == 256 then
		setProperty('flash.alpha', 0)
		cameraFade('camOther', 'ffffff', 0.7, true, true)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 288 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 2432 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 6, 'linear')
	end
	if curStep == 2528 then
		doTweenAlpha('backInLOL', 'flash', 0, (240/curBpm), 'expoIn')
	end
	if curStep == 3712 then
		doTweenAlpha('actualFadeOut', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
end