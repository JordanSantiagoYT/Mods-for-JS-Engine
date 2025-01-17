function onCreatePost()
	makeLuaText('Credits', "Legitimate\n\nSong by TimeLaserz\n\nChart by Jordan Santiago\n\nOpponent Sprites by TheTrueAccount_2", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camHUD')

	addChromaticAbberationEffect('camHUD', 0.002);
	addChromaticAbberationEffect('camGame', 0.002);
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 32, 'linear')
	doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
end

function onStepHit()
	if curStep == 736 then
		doTweenY('creditTween', 'Credits', -360, 1.3, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.3, 'linear')
	end
	if curStep == 3584 then
		doTweenAlpha('fadeOut', 'flash', 1, 10.97, 'linear')
	end
end