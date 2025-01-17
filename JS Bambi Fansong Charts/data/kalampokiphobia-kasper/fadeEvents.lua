function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 14, 'linear')
end

canBloom = false --Whether the bloom bop is allowed to be active.
bloomFreq = 4 --The frequency of the bloom bop in beats.
bloomDecay = 0.95; --The decaying speed of the bloom.
bloomBop = 0.5; --The amount of bloom that should be added every time a bop occurs.
bloomAmt = 0; --The amount of blooming.

function onStepHit()
	if curStep == 512 or curStep == 2560 then
		canBloom = true
		bloomReset = false
		bloomFreq = 4
		bloomDecay = 0.92
		bloomBop = 0.35
	end
	if curStep == 2032 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('okBye', 'flash', 1, 0.45, 'linear')
	end
	if curStep == 2048 or curStep == 3584 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		canBloom = false
	end
	if curStep == 3584 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('okBye', 'flash', 1, 1.8, 'linear')
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