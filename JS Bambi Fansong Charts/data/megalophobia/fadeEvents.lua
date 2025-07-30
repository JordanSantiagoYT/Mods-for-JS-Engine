function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Megalophobia\n\nSong by CursedFlamesS\n\nChart by Jordan Santiago\n\nOpponent Sprites by Enzo Polis", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onStepHit()
	if curStep == 256 then
		doTweenAlpha('flTw', 'flash', 0, 5, 'linear')
	end
	if curStep == 496 then
		setProperty('flash.alpha', 1)
	end
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 608 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 4608 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 4736 then
		doTweenAlpha('flTw', 'flash', 1, 11, 'linear')
	end
end