function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Theft\n\nSong by M\n\nChart by Jordan Santiago", 1250, 0, 720)
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
	doTweenAlpha('flTw', 'flash', 0.5, (240/curBpm) * 3, 'linear')
end

function onStepHit()
	if curStep == 64 then
		cameraFlash('camOther', 'ffffff', 0.5)
		setProperty('flash.alpha', 0)
	end
	if curStep == 128 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 160 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 576 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('p2Bar.visible', true)
		setProperty('daveIcon.visible', true)
		setProperty('dave.visible', true)
	end
	if curStep == 1152 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
	end
end