function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Technicular Condition\n\nSong by JackJones1982\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIn', 'flash', 0, (240/curBpm) * 2, 'linear')
end

function onStepHit()
	if curStep == 32 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('oppSprite.alpha', 1)
		doTweenY('creditTween', 'Credits', 280, (240/curBpm), 'expoOut')
	end
	if curStep == 96 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1856 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('oppSprite.alpha', 0)
	end
	if curStep == 1856 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
end