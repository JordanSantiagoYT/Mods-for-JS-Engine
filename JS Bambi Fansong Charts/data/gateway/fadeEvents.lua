function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 0)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Gateway\n\nSong by TimeLaserz\n\nChart by Jordan Santiago\n\nUTE Sprites by oriiien‬\n\nTrue Time by tannerwolters5462\n\nAll other assets by TimeLaserz", 1250, 0, 720)
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
   	doTweenColor('boyfriendColorTween', 'boyfriend', '0xffFF9999', 0.01, 'quadInOut')
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 200, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 24, 'linear')
end

function onStepHit()
	if curStep == 456 then
		doTweenY('creditTween', 'Credits', -420, 1.4, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.4, 'linear')
	end
	if curStep == 2560 or curStep == 16512 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setProperty('opp1.alpha', 1)
	end
	if curStep == 5632 or curStep == 16640 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setProperty('opp1.alpha', 0)
		setProperty('opp2.alpha', 1)
		doTweenColor('boyfriendColorTween', 'boyfriend', '0xffFF9999', 0.01, 'quadInOut')
	end
	if curStep == 9984 or curStep == 16768 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setProperty('opp2.alpha', 0)
		setProperty('opp3.alpha', 1)
	end
	if curStep == 13568 or curStep == 16896 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setProperty('opp3.alpha', 0)
		setProperty('opp4.alpha', 1)
	end
	if curStep == 16384 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setProperty('opp4.alpha', 0)
		doTweenColor('boyfriendColorTween', 'boyfriend', '0xffFF9999', 0.01, 'quadInOut')
	end
	if curStep == 17408 then
		cameraFlash('camOther', 'FFFFFF', 0.5)
		setProperty('opp4.alpha', 0)
		doTweenColor('boyfriendColorTween', 'boyfriend', '0xffFF9999', 0.01, 'quadInOut')
	end
	if curStep == 17424 then
		cameraFlash('camOther', 'FFFFFF', 0.5)
		setProperty('opp1.alpha', 1)
	end
	if curStep == 17440 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setProperty('opp1.alpha', 0)
		setProperty('opp2.alpha', 1)
		doTweenColor('boyfriendColorTween', 'boyfriend', '0xffFF9999', 0.01, 'quadInOut')
	end
	if curStep == 17456 then
		cameraFlash('camOther', 'FFFFFF', 0.5)
		setProperty('opp2.alpha', 0)
		setProperty('opp3.alpha', 1)
	end
	if curStep == 17472 then
		cameraFlash('camOther', 'FFFFFF', 0.5)
		setProperty('opp3.alpha', 0)
		setProperty('opp4.alpha', 1)
	end
	if curStep == 17488 then
		cameraFlash('camOther', 'FFFFFF', 0.5)
		setProperty('opp3.alpha', 1)
		setProperty('opp4.alpha', 0)
	end
	if curStep == 17504 then
		cameraFlash('camOther', 'FFFFFF', 0.25)
		setProperty('opp2.alpha', 1)
		setProperty('opp3.alpha', 0)
	end
	if curStep == 17512 then
		cameraFlash('camOther', 'FFFFFF', 0.25)
		setProperty('opp1.alpha', 1)
		setProperty('opp2.alpha', 0)
		doTweenColor('boyfriendColorTween', 'boyfriend', '0xffFF9999', 0.01, 'quadInOut')
	end
	if curStep == 17520 then
		cameraFlash('camOther', 'FFFFFF', 0.5)
		setProperty('opp1.alpha', 0)
	end
	if curStep == 17536 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setProperty('opp4.alpha', 1)
		doTweenColor('boyfriendColorTween', 'boyfriend', '0xffFF9999', 0.01, 'quadInOut')
	end
	if curStep == 17856 then
		doTweenAlpha('okBye', 'flash', 1, 15, 'linear')
	end
end