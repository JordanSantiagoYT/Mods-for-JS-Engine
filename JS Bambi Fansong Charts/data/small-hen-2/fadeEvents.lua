function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Cicidio Song 2 (Small Hen 2)\n\nSong by Enzo Polis\n\nChart by Jordan Santiago\n\nOpponent Sprites by TheTrueAccount_2", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 240, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 6.66, 'linear') --MWAHAHAHAHAHAHAHAHA
end

function onStepHit()
	if curStep == 104 then
		doTweenY('creditTween', 'Credits', -420, 1.4, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.4, 'linear')
	end
	if curStep == 868 or curStep == 876 or curStep == 882 or curStep == 886 then
		setProperty('flash.alpha', 1)
	end
	if curStep == 872 or curStep == 880 or curStep == 884 or curStep == 888 then
		setProperty('flash.alpha', 0)
	end
	if curStep == 896 or curStep == 1408 or curStep == 1536 or curStep == 1920 or curStep == 2176 or curStep == 2432 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'FFFFFF', 0.7)
	end
	if curStep == 1528 or curStep == 1530 or curStep == 1532 or curStep == 1534 then
		cameraFlash('camOther', '0x44FFFFFF', 0.08)
	end
	if curStep == 2560 then
		doTweenAlpha('okBye', 'flash', 1, 0.85, 'linear')
	end
end