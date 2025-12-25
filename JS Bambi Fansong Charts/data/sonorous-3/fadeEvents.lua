function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Sonorous 3\n\nSong by Null_y34r\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIn', 'flash', 0, (240/curBpm) * 128, 'linear')
end

function onStepHit()
	if curStep == 2048 then
		doTweenY('creditTween', 'Credits', 280, (1920/curBpm), 'expoOut')
	end
	if curStep == 2560 then
		doTweenY('creditTween', 'Credits', -420, (1920/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (1920/curBpm), 'linear')
	end
	if curStep == 18432 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 128, 'linear')
	end
end