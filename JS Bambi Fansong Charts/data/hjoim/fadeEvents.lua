function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Hjoim (Remake)\n\nSong by joolieiscool\n\nChart by Jordan Santiago\n\nHjoim Sprites by Half_Joke", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flashOut', 'flash', 0.5, 10, 'linear')
end

function onStepHit()
	if curStep == 112 then
		doTweenAlpha('flashOut', 'flash', 1, 1, 'expoOut')
	end
	if curStep == 124 then
		doTweenAlpha('flashOut2', 'flash', 0, 0.48, 'linear')
	end
	if curStep == 128 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 160 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1536 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 8, 'expoOut')
	end
end