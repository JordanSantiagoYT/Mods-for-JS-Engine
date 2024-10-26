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
	doTweenAlpha('flTw', 'flash', 0, 8, 'linear')
end

canBloom = false
bloomFreq = 4
bloomDecay = 0.95;

function onStepHit()
	if curStep == 256 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('okBye', 'flash', 1, 9.45, 'linear')
	end
	if curStep == 416 then
		canBloom = true
		bloomReset = false
		bloomFreq = 4
		setProperty('flash.alpha', 0)
	end
	if curStep == 672 or curStep == 1216 or curStep == 2144 or curStep == 2784 then
		canBloom = false
	end
	if curStep == 928 or curStep == 1856 then
		setProperty('flash.alpha', 1)
	end
	if curStep == 960 or curStep == 1888 then
		canBloom = true
		bloomReset = false
		bloomFreq = 2
		bloomDecay = 0.9
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 2272 then
		canBloom = true
		bloomReset = false
		bloomFreq = 1
		bloomDecay = 0.8
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 2528 then
		canBloom = true
		bloomReset = false
		bloomFreq = 2
		bloomDecay = 0.9
	end
	if curStep == 2912 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('okBye', 'flash', 1, 10, 'linear')
	end
end

bloomAmt = 1;

function onBeatHit()
	if canBloom and curBeat % bloomFreq == 0 then
		bloomAmt = 0.3;
	end
end

bloomReset = false
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