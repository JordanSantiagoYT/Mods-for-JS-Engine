function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Geometroterrorophobia (V2)\n\nSong by TriangleSTMaker\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 31, 'linear')
end

function onStepHit()
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, (480/curBpm), 'expoOut')
	end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 2080 then
		cameraFlash('camOther', 'ffffff', 0.7)
		addBloomEffect('camGame', 0.25)
		addBloomEffect('camHUD', 0.25)
		addBlockedGlitchEffect('camGame')
	end
	if curStep == 2592 or curStep == 2656 then
		cameraFlash('camOther', '000000', 0.7)
		clearEffects('camGame')
		clearEffects('camHUD')
	end
	if curStep == 2624 then
		addBloomEffect('camGame', 0.25)
		addBloomEffect('camHUD', 0.25)
		addBlockedGlitchEffect('camGame')
		doTweenAlpha('fadeOut', 'flash', 1, (480/curBpm))
	end
end