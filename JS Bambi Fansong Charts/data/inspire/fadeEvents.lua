function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 90)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Inspire\n\nSong by Jadon B\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 10, 'linear')
end

function onStepHit()
	if curStep == 112 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 512 or curStep == 576 then
		doTweenAlpha('goingIn', 'flash', 0.7, 1.3, 'linear')
	end
	if curStep == 544 or curStep == 608 then
		doTweenAlpha('goingOut', 'flash', 0, 1.3, 'linear')
	end
	if curStep == 1536 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fakeBye', 'flash', 1, 15.8, 'linear')
	end
	if curStep == 1728 then
		doTweenAlpha('neverMind', 'flash', 0, 3.99, 'linear')
	end
	if curStep == 2304 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('okBye', 'flash', 1, 21.3, 'linear')
	end
end