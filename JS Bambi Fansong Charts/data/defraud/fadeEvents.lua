function onCreatePost()
	luaDebugMode = true
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Defraud\n\nSong by ruxin8486\n\nOpponent Sprites by HalfJoke", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	setProperty('dad.alpha', 0.0001)
	dadPositionX = getProperty("dad.x")
	dadPositionY = getProperty("dad.y")
end

canBloom = false --Whether the bloom bop is allowed to be active.
bloomFreq = 4 --The frequency of the bloom bop in beats.
bloomDecay = 0.95; --The decaying speed of the bloom.
bloomBop = 0.5; --The amount of bloom that should be added every time a bop occurs.
bloomAmt = 0; --The amount of blooming.
doingTransition = false

function onSongStart()
	doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
end

function onStepHit()
	if curStep == 64 then
            	noteTweenAlpha('byeNote1', 0, 0, 0.001, 'linear');
            	noteTweenAlpha('byeNote2', 1, 0, 0.001, 'linear');
            	noteTweenAlpha('byeNote3', 2, 0, 0.001, 'linear');
            	noteTweenAlpha('byeNote4', 3, 0, 0.001, 'linear');
		noteTweenX('bfStrumX', 4, 415, 0.001, 'quartInOut')
		noteTweenX('bfStrumX1', 5, 525, 0.001, 'quartInOut')
		noteTweenX('bfStrumX2', 6, 635, 0.001, 'quartInOut')
		noteTweenX('bfStrumX3', 7, 745, 0.001, 'quartInOut')
		doTweenAlpha('flTw', 'flash', 0, 8, 'linear')
	end
	if curStep == 116 then
		doTweenY('creditTween', 'Credits', -360, 1.4, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.4, 'linear')
	end
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('dad.alpha', 1)
		for i=0, 3 do
            		noteTweenAlpha('noteBack'..i, i, 1, 0.4, 'linear');
		end
		noteTweenX('bfStrumBack', 4, defaultPlayerStrumX0, 1.0, 'quartInOut')
		noteTweenX('bfStrumBack1', 5, defaultPlayerStrumX1, 1.1, 'quartInOut')
		noteTweenX('bfStrumBack2', 6, defaultPlayerStrumX2, 1.2, 'quartInOut')
		noteTweenX('bfStrumBack3', 7, defaultPlayerStrumX3, 1.3, 'quartInOut')
	end
	if curStep == 256 then
		canBloom = true
		bloomReset = false
		bloomFreq = 1
		bloomDecay = 0.95
		bloomBop = 0.1
	end
	if curStep == 320 then
		bloomDecay = 0.925
		bloomBop = 0.5
	end
	if curStep == 632 or curStep == 1144 then
		prepTransition(true)
	end
	if curStep == 640 or curStep == 1152 then
		transition(true)
	end
	if curStep == 648 or curStep == 904 or curStep == 1160 then
		doingTransition = false
		triggerEvent('Camera Follow Pos', '', '')
	end
	if curStep == 888 then
		prepTransition(false)
	end
	if curStep == 896 then
		transition(false)
	end
	if curStep == 904 or curStep == 1160 then
		canBloom = true
	end
	if curStep == 1408 then
		canBloom = false
	end
	if curStep == 1712 then cameraFade('camOther', 'ffffff', 2) end
	if curStep == 1728 then
		cameraFade('camOther', 'ffffff', 1, true, true)
		setProperty('flash.alpha', 1)
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
    		bloomAmt = bloomAmt * math.pow(bloomDecay, elapsed * 60 * playbackRate)
   		addBloomEffect('camGame', bloomAmt)
    		addBloomEffect('camHUD', bloomAmt)
	elseif not bloomReset then
		bloomReset = true
    		clearEffects('camHUD')
    		clearEffects('camGame')
	end

	if not doingTransition then
    		songPos = getSongPosition()
    		local currentBeat = (songPos/1780)*(bpm/60)
    		doTweenY(dadTweenY, 'dad', 60-110*math.sin((currentBeat*0.25)*math.pi),0.2)
		if not mustHitSection then
			cameraSetTarget('dad')
		end
	end
end

function onEvent(n,v1,v2)
	if n == 'Add Camera Zoom' and bloomAmt < 0.5 and canBloom then
		bloomAmt = bloomAmt + (v1 * 5)
	end
end

function prepTransition(unfair)
	canBloom = false
	cameraFade('camGame', 'ffffff', 1, true, false)
	doingTransition = true
	if unfair then 
		doTweenY('byedad', 'dad', -1280, 1, 'expoIn')
	else
		doTweenX('byedad1', 'dad', 1880, 1, 'expoIn')
	end
end

function transition(unfair)
	cameraFade('camGame', 'ffffff', 1, true, true)
	if unfair then
		setProperty('dad.y', -1280)
		setProperty('dad.x', 1380)
		triggerEvent('Camera Follow Pos', 1780, 450)
		noteTweenX('strumSwap0', 0, defaultPlayerStrumX0, 1.4, 'expoOut')
		noteTweenX('strumSwap1', 1, defaultPlayerStrumX1, 1.4, 'expoOut')
		noteTweenX('strumSwap2', 2, defaultPlayerStrumX2, 1.4, 'expoOut')
		noteTweenX('strumSwap3', 3, defaultPlayerStrumX3, 1.4, 'expoOut')
		noteTweenX('strumSwap4', 4, defaultOpponentStrumX0, 1.4, 'expoOut')
		noteTweenX('strumSwap5', 5, defaultOpponentStrumX1, 1.4, 'expoOut')
		noteTweenX('strumSwap6', 6, defaultOpponentStrumX2, 1.4, 'expoOut')
		noteTweenX('strumSwap7', 7, defaultOpponentStrumX3, 1.4, 'expoOut')
	else
		setProperty('dad.y', 1280)
		setProperty('dad.x', dadPositionX)
		triggerEvent('Camera Follow Pos', 200, 450)
		noteTweenX('strumBack0', 0, defaultOpponentStrumX0, 1.4, 'expoOut')
		noteTweenX('strumBack1', 1, defaultOpponentStrumX1, 1.4, 'expoOut')
		noteTweenX('strumBack2', 2, defaultOpponentStrumX2, 1.4, 'expoOut')
		noteTweenX('strumBack3', 3, defaultOpponentStrumX3, 1.4, 'expoOut')
		noteTweenX('strumBack4', 4, defaultPlayerStrumX0, 1.4, 'expoOut')
		noteTweenX('strumBack5', 5, defaultPlayerStrumX1, 1.4, 'expoOut')
		noteTweenX('strumBack6', 6, defaultPlayerStrumX2, 1.4, 'expoOut')
		noteTweenX('strumBack7', 7, defaultPlayerStrumX3, 1.4, 'expoOut')
	end
	doTweenY('opponentComes', 'dad', dadPositionY, 0.7, 'expoOut')
end