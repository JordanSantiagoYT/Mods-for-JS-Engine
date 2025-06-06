function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Garden Stealer (TimeLaserz Remix)\n\nSong by TimeLaserz\n\nChart by Jordan Santiago\n\nOpponent Sprites by oriiien", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	setProperty('healthBarBG.visible', true)
	setProperty('healthBar.visible', true)
	setProperty('iconP1.visible', true)
	setProperty('iconP2.visible', true)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 21, 'linear')
end

function onStepHit()
	if curStep == 224 then
		doTweenY('creditTween', 'Credits', -420, 1.4, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.4, 'linear')
	end
	if curStep == 1600 then
		doTweenAlpha('okBye', 'flash', 1, 21.1, 'linear')
	end
end