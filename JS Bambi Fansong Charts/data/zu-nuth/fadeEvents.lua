function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
	setProperty('dad.alpha', 0)
	setProperty('dad.color', 000000)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 35, 'linear')
end

canBloom = false --Whether the bloom bop is allowed to be active.
bloomFreq = 4 --The frequency of the bloom bop in beats.
bloomDecay = 0.95; --The decaying speed of the bloom.
bloomBop = 0.5; --The amount of bloom that should be added every time a bop occurs.
bloomAmt = 0; --The amount of blooming.

function onStepHit()
	if curStep == 16 then
            	noteTweenAlpha('byeNote1', 0, 0, 1, 'linear');
            	noteTweenAlpha('byeNote2', 1, 0, 1, 'linear');
            	noteTweenAlpha('byeNote3', 2, 0, 1, 'linear');
            	noteTweenAlpha('byeNote4', 3, 0, 1, 'linear');
		noteTweenX('bfStrumX', 4, 415, 0.8, 'quartInOut')
		noteTweenX('bfStrumX1', 5, 525, 0.9, 'quartInOut')
		noteTweenX('bfStrumX2', 6, 635, 1, 'quartInOut')
		noteTweenX('bfStrumX3', 7, 745, 1.1, 'quartInOut')
	end
	if curStep == 1020 then
		canBloom = true
		bloomReset = false
		bloomFreq = 4
		bloomDecay = 0.9
		bloomBop = 0.5
	end
	if curStep == 1272 then
            	noteTweenAlpha('noteBack1', 0, 1, 0.4, 'linear');
           	noteTweenAlpha('noteBack2', 1, 1, 0.4, 'linear');
            	noteTweenAlpha('noteBack3', 2, 1, 0.4, 'linear');
            	noteTweenAlpha('noteBack4', 3, 1, 0.4, 'linear');
		noteTweenX('bfStrumX', 4, defaultPlayerStrumX0, 1.0, 'quartInOut')
		noteTweenX('bfStrumX1', 5, defaultPlayerStrumX1, 1.1, 'quartInOut')
		noteTweenX('bfStrumX2', 6, defaultPlayerStrumX2, 1.2, 'quartInOut')
		noteTweenX('bfStrumX3', 7, defaultPlayerStrumX3, 1.3, 'quartInOut')
	end
	if curStep == 1280 then
		doTweenAlpha('opponentIsComing', 'dad', 0.6, 7.6, 'linear')
	end
	if curStep == 1504 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fadeIn', 'flash', 1, 0.6, 'linear')
	end
	if curStep == 1528 then
		doTweenAlpha('noLol', 'flash', 0, 0.28, 'linear')
	end
	if curStep == 1536 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('dad.alpha', 1)
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		bloomFreq = 2
		bloomDecay = 0.85
	end
	if curStep == 2048 or curStep == 2546 or curStep == 4352 then
		bloomFreq = 8
		bloomDecay = 0.92
	end
	if curStep == 1408 or curStep == 2176 or curStep == 2688 or curStep == 2976 or curStep == 3552 or curStep == 3584 or curStep == 4224 or curStep == 4448 or curStep == 4608 then
		bloomFreq = 2
		bloomDecay = 0.85
	end
	if curStep == 1472 or curStep == 2944 or curStep == 3056 or curStep == 3312 or curStep == 3440 or curStep == 3568 or curStep == 4584 or curStep == 5088 then
		bloomFreq = 1
		bloomDecay = 0.7
	end
	if curStep == 3072 or curStep == 3328 or curStep == 3456 then
		bloomFreq = 4
		bloomDecay = 0.9
	end
	if curStep == 4032 then
		bloomFreq = 8
		bloomDecay = 0.9
	end
	if curStep == 5120 then
		bloomFreq = 32
		bloomDecay = 0.875
	end
	if curBeat == 1536 then
		bloomFreq = 16
		bloomDecay = 0.9
	end
	if curBeat == 1792 then
		canBloom = false
	end
	if curBeat == 2048 then
		setProperty('dad.alpha', 0)
	end
	if curBeat == 2176 then
		doTweenAlpha('okBye', 'flash', 1, 8.7, 'linear')
	end
	if curBeat == 2304 then
		cameraFlash('camOther', 'ffffff', 0.7)
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
	if n == 'Add Camera Zoom' and bloomAmt < 0.5 and canBloom then
		bloomAmt = bloomAmt + (v1 * 5)
	end
end