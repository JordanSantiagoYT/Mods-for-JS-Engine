function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Ethereal Domain\n\nSong by TofpFL\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('p2Bar.visible', false)
	setProperty('daveIcon.visible', false)
	setProperty('dave.visible', false)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 32, 'linear')
end

function onStepHit()
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1662 then
		doTweenAlpha('flTw2', 'flash', 0.9, (30/curBpm), 'linear')
	end
	if curStep == 1664 or curStep == 2304 or curStep == 2432 then
		doTweenAlpha('flTw3', 'flash', 0, (240/curBpm), 'expoIn')
	end
	if curStep == 2302 or curStep == 2430 then
		doTweenAlpha('flTw4', 'flash', 0.7, (30/curBpm), 'linear')
	end
	if curStep == 2592 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
end