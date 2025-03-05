function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camGame')

	makeLuaText('Credits', "BluePen\n\nSong by Monroe14\n\nChart by Jordan Santiago\n\nSprites by funni_z3mp", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	doTweenColor('dadColorTween', 'dad', '64c8ff', 0.01, 'quadInOut')
	addBloomEffect ('dad', 0.3)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 11, 'linear')
end

function onStepHit()
	if curStep == 112 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 2560 then
		setObjectCamera('Credits', 'camOther')
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('okBye', 'flash', 1, 0.01, 'linear')
	end
end