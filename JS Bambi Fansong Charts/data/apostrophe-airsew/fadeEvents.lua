function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Apostrophe (Airsew Remix)\n\nSong by Airsew\n\nOG Song by Null_y34r\n\nChart by Jordan Santiago\n\nOpponent Sprites by Half_Joke", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 32, 'linear')
end

function onStepHit()
	if curStep == 512 then
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 2560 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0.6)
	end
	if curStep == 2816 then
		doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 16, 'linear')
	end
	if curStep == 4672 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 12, 'linear')
	end
end