function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Opposition (Moonie Sides Redux)\n\nSong by mooniemooni8166\n\nChart by Jordan Santiago\n\nOpponent Sprites by Enzo Polis", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 36)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 4, 'linear')
end

function onStepHit()
	if curStep == 256 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 260, (240/curBpm), 'expoOut')
	end
	if curStep == 288 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 512 or curStep == 1152 or curStep == 1440 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 1760 then
		doTweenAlpha('fadeOutro', 'flash', 1, (240/curBpm) * 4, 'linear')
	end
end