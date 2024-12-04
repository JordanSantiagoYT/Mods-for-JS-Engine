function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	--bpm texts (special thanks to https://flamingtext.com/logo/Design-Business?fontname=Comic+Sans+MS, thats where i generated them from)

	makeLuaSprite('bpm1', 'moriBPMS/388', 480, 720);
	addLuaSprite('bpm1', true);
	setObjectCamera('bpm1', 'camHUD')
	makeLuaSprite('bpm2', 'moriBPMS/3104', 450, 720);
	addLuaSprite('bpm2', true);
	setObjectCamera('bpm2', 'camHUD')
	makeLuaSprite('bpm3', 'moriBPMS/74496', 420, 720);
	addLuaSprite('bpm3', true);
	setObjectCamera('bpm3', 'camHUD')
	makeLuaSprite('bpmEnd', 'moriBPMS/388-end', 360, 720);
	addLuaSprite('bpmEnd', true);
	setObjectCamera('bpmEnd', 'camHUD')
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 19, 'linear')
end

canBloom = false --Whether the bloom bop is allowed to be active.
bloomFreq = 4 --The frequency of the bloom bop in beats.
bloomDecay = 0.95; --The decaying speed of the bloom.
bloomBop = 0.5; --The amount of bloom that should be added every time a bop occurs.
bloomAmt = 0; --The amount of blooming.

bpmToTween = 0
function onStepHit()
	if curStep == 504 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('flTw', 'flash', 1, 0.14, 'linear')
	end
	if curStep == 510 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('flTw', 'flash', 0, 0.07, 'linear')
	end
	if curStep == 512 or curStep == 1024 or curBeat == 640 then
		canBloom = true
		bloomReset = false
		bloomFreq = 4
		bloomDecay = 0.92
		bloomBop = 0.35
	end
	if curStep == 512 or curBeat == 640 or curBeat == 896 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 1008 then
		bloomFreq = 1
		bloomDecay = 0.7
	end
	if curStep == 1536 or curBeat == 636 or curBeat == 892 then
		canBloom = false
	end
	if curStep == 1536 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curBeat == 636 or curBeat == 892 then
		setProperty('flash.alpha', 1)
	end
	if curStep == 2046 or curStep == 4062 then
		canBloom = true
		bloomReset = false
		bloomFreq = 2
		bloomDecay = 0.87
	end
	if curStep == 2048 or curStep == 4096 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curBeat == 1152 then
		canBloom = false
	end
	if curBeat == 1200 then
		doTweenAlpha('okBye', 'flash', 1, 2.8, 'linear')
	end

	--BPM TEXT + TWEENING IN/OUT
	if curStep == 512 or curStep == 1536 or curStep == 2560 or curStep == 3584 or curStep == 4608 then
		bpmToTween = bpmToTween + 1;
		doTweenY('bpm1', 'bpm' .. bpmToTween .. '', 320, 2, 'expoOut')
	end
	if curStep == 640 or curStep == 1664 or curStep == 2688 or curStep == 3840 or curStep == 4736 then
		doTweenY('byeBPM', 'bpm' .. bpmToTween .. '', 720, 2, 'expoIn')
	end
	if curBeat == 636 then
		bpmToTween = 0;
	end
	if curBeat == 892 then
		bpmToTween = 2;
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
		addChromaticAbberationEffect('camGame', 0.002)
	elseif not bloomReset then
		bloomReset = true
    		clearEffects('camHUD')
    		clearEffects('camGame')
 		addChromaticAbberationEffect('camGame', 0.002)
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