function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Slidenoteification 9 (but Better)\n\nSong by Enzo Polis\n\nChart by Jordan Santiago\n\nOpponent Sprites by TheTrueAccount_2\n\nSad Bandu icons by SonicJrthecoolest\n\nLua Extra Keys by TheZoroForce240", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	setProperty('camZooming', true)
    	dadPositionY = getProperty("dad.y")
	setProperty('dad.y', -3000)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 180, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 18, 'linear')
end

function onStepHit()
	if curStep == 240 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
		doTweenY('opponentComes', 'dad', dadPositionY, 1.14, 'expoOut')
	end
	if curStep == 256 or curStep == 768 or curStep == 1024 or curStep == 1280 or curStep == 1792 or curStep == 2048 or curStep == 2304 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 2560 then
		doTweenAlpha('dadFuckingDies', 'dad', 0, 2.3, 'linear')
	end
	if curStep == 2624 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('okBye', 'flash', 1, 18, 'linear')
	end
end