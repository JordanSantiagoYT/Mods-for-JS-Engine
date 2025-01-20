function onCreatePost()
	makeLuaText('Credits', "SACRIFICE\n\nSong by hafp_\n\nChart by Jordan Santiago\n\nFajil Sprites by harbinger_1803", 1250, 0, 720)
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

	setProperty('dad.alpha', 0)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 24.7, 'linear')
end

canBloom = false --Whether the bloom bop is allowed to be active.
bloomFreq = 4 --The frequency of the bloom bop in beats.
bloomDecay = 0.95; --The decaying speed of the bloom.
bloomBop = 0.5; --The amount of bloom that should be added every time a bop occurs.
bloomAmt = 0; --The amount of blooming.

function onStepHit()
	if curStep == 102 then
		doTweenY('creditTween', 'Credits', -360, 2.3, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 2.3, 'linear')
	end
	if curStep == 256 then
		canBloom = true
		bloomReset = false
		bloomFreq = 4
		bloomDecay = 0.92
		bloomBop = 0.35
	end
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('dad.alpha', 1)
	end
	if curStep == 640 then
		doTweenAlpha('fadeTween', 'flash', 0.6, 0.6, 'expoOut')
	end
	if curStep == 652 or curStep == 1532 then
		doTweenAlpha('fadeTween2', 'flash', 1, 0.3, 'linear')
	end
	if curStep == 656 or curStep == 1024 or curStep == 2032 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 1008 or curStep == 2020 then setProperty('flash.alpha', 1) end

	if curStep == 1024 or curStep == 2032 then
		canBloom = true
		bloomFreq = 1
		bloomDecay = 0.84
		bloomBop = 0.5
	end
	if curStep == 1536 then
		canBloom = false
		doTweenAlpha('fadingOut', 'flash', 0, 60.42, 'linear')
		setObjectCamera('flash', 'camOther')
	end
	if curStep == 1537 then
		addVCREffect('camHUD')
		addVCREffect('camGame')
		addGrayscaleEffect('camHUD')
		addGrayscaleEffect('camGame')
	end
	if curStep == 2020 then
		clearEffects('camHUD')
		clearEffects('camGame')
	end
	if curStep == 2528 then
		canBloom = false
		clearEffects('camHUD')
		clearEffects('camGame')
	end
	if curStep == 2672 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('okBye', 'flash', 1, 23.223, 'linear')
	end
end

function onBeatHit()
	if canBloom and curBeat % bloomFreq == 0 then
		if bloomAmt < 0.6 then bloomAmt = bloomAmt + bloomBop;
		end
	end
end

function onUpdate(elapsed)
	if canBloom then
    		clearEffects('camHUD')
    		clearEffects('camGame')
    		bloomAmt = bloomAmt * math.pow(bloomDecay, elapsed * 60)
   		addBloomEffect('camGame', bloomAmt)
    		addBloomEffect('camHUD', bloomAmt)
	elseif not bloomReset then
		bloomReset = true
    		clearEffects('camHUD')
    		clearEffects('camGame')
	end
end

function onEvent(n,v1,v2)
	if v1 == '' then
		v1 = 0.03
	end
	if n == 'Add Camera Zoom' and bloomAmt < 0.5 and canBloom then
		bloomAmt = bloomAmt + (v1 * 5)
	end
end