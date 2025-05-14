function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 0.7)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "No Hen (is Dead)\n\nSong by Seriously_2212\n\nChart by Jordan Santiago\n\nOpponent Sprites by TheTrueAccount_2", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 7, 'linear')
end

function onStepHit()
	if curStep == 112 then
		doTweenAlpha('fadeOut', 'flash', 0.7, 0.86, 'linear')
	end
	if curStep == 124 then
		doTweenAlpha('fadeOut', 'flash', 0, 0.3, 'linear')
	end
	if curStep == 128 then
		doTweenY('creditTween', 'Credits', 260, 2, 'expoOut')
	end
	if curStep == 160 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1536 then
		doTweenAlpha('okBye', 'flash', 1, 11.6, 'linear')
	end
end