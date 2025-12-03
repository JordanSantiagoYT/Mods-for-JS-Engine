function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Aekrf\n\nSong by Seriously_2212\n\nChart by Jordan Santiago\n\nHjoim Sprites by Half_Joke", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flashOut', 'flash', 0, (240/curBpm) * 32, 'linear')
end

function onStepHit()
	if curStep == 512 then
		--cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 270, (480/curBpm), 'expoOut')
	end
	if curStep == 560 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 1280 then
		doTweenAlpha('fadeOut1', 'flash', 0.8, (240/curBpm) * 16, 'linear')
	end
	if curStep == 1536 then
		doTweenAlpha('fadeOut1Finish', 'flash', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1600 then
		doTweenAlpha('backFade', 'flash', 0, (240/curBpm) * 2, 'linear')
	end
	if curStep == 2816 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 8.2, 'linear')
	end
end