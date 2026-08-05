function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Trigger Digger Skibidi Gummy Bear\n\nSong by novyxEcho\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 36)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	makeLuaText('Misc', "Trigger", 1250, 0, 0)
	setTextAlignment('Misc', 'Center')
	addLuaText('Misc')
	setProperty('Misc.alpha', 0)
	setTextSize('Misc', 60)
	setObjectCamera('Misc', 'camOther')
	setTextBorder('Misc', 3, '000000')
	screenCenter('Misc')

	setProperty('dad.singDuration', 8)
	setProperty('boyfriend.singDuration', 8)
	setProperty('camZoomingDecay', 2.5)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	setProperty('Misc.alpha', 1)
	setProperty('Misc.scale.x', 1.25)
	setProperty('Misc.scale.y', 1.25)
	doTweenScale('miscOut', 'Misc', 1, (120/curBpm), 'expoOut')
end

texts = {'Trigger', 'Digger', 'Skibidi'}
function onStepHit()
	if curStep <= 48 and curStep % 12 == 0 then
		setProperty('Misc.alpha', 1)
		setProperty('Misc.scale.x', 1.25)
		setProperty('Misc.scale.y', 1.25)
		doTweenScale('miscOut', 'Misc', 1, (180/curBpm), 'expoOut')
		if curStep / 12 > 0 and curStep / 12 < 3 then
			setTextString('Misc', texts[(curStep / 12) + 1])
		else
			setProperty('Misc.color', getColorFromHex('FF0000'))
			setTextString('Misc', 'No.')
		end
	end
	if curStep == 48 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, (480/curBpm), 'expoOut')
		setProperty('flash.alpha', 0)
		setProperty('Misc.alpha', 0)
	end
	if curStep == 144 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 2352 then
		cameraFlash('camOther', 'ffffff', 0.7)
		addBlockedGlitchEffect('camGame')
	end
	if curStep == 2736 then
		doTweenAlpha('coolEffect', 'flash', 0.4, (180/curBpm))
	end
	if curStep == 2784 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 3504 then
		cameraFlash('camOther', 'ffffff', 0.7)
		addBloomEffect('camGame', 0.25)
		addBloomEffect('camHUD', 0.25)
	end
	if curStep == 3888 then
		cameraFlash('camOther', 'ffffff', 0.7)
		clearEffects('camGame')
		clearEffects('camHUD')
	end
	if curStep == 4080 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 12, 'linear')
	end
end

function onEvent(n,v1,v2)
	if n == 'Change Character' then
		setProperty('dad.singDuration', 8)
		setProperty('boyfriend.singDuration', 8)
	end
end