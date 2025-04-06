function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Neptunian (V2)\n\nSong by TimeLaserz\n\nChart by Jordan Santiago\n\nBF Sprites from D&B Nullified", 1250, 0, 720)
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

	addChromaticAbberationEffect('camHUD', 0.002)
	addChromaticAbberationEffect('camGame', 0.001)
	doTweenColor('boyfriendColorTween', 'boyfriend', '0xffADABFF', 0.01, 'quadInOut')
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 19.8, 'linear')
end

function onStepHit()
	if curStep == 480 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 4672 then
		doTweenAlpha('fadeOut', 'flash', 1, 17.4, 'linear')
	end
end

function onBeatHit()
	if curBeat >= 256 and curBeat < 368 or curBeat >= 896 and curBeat <= 1152 then
		if curBeat % 8 == 3 or curBeat % 8 == 6 then
			triggerEvent('Add Camera Zoom', 0.03, 0.06)
			if curBeat >= 896 then
				setProperty('camTwistIntensity', 3)
				runHaxeCode('game.doTwist();')
			end
		end
	end
end