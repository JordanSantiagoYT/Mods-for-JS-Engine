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

canBloom = false
bloomFreq = 4
bloomDecay = 0.95;
bloomBop = 0.3;

function onStepHit()
	if curStep == 512 then
		canBloom = true
		bloomReset = false
		bloomFreq = 8
		bloomDecay = 0.95
		bloomBop = 0.5
	end
	if curBeat == 1664 then
		canBloom = false
	end
	if curBeat == 1728 then
		doTweenAlpha('okBye', 'flash', 1, 5.8, 'linear')
	end
end

bloomAmt = 1;

function onBeatHit()
	if canBloom and curBeat % bloomFreq == 0 then
		bloomAmt = bloomBop;
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