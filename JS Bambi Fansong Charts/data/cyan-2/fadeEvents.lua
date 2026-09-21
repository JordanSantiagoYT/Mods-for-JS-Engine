doBotShit = false

function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Cyan 2\n\nSong by mooniemooni8166\n\nChart by Jordan Santiago\n\nOpponent Sprites by MrLambiLOL", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	makeLuaSprite('coolCyan', 'CyanThing', 0, 0);
	addLuaSprite('coolCyan', true);
	setLuaSpriteScrollFactor('coolCyan', 0, 0)
	setProperty('coolCyan.alpha', 0)
	setObjectCamera('coolCyan', 'camHUD')
	
	doBotShit = not getProperty('cpuControlled')
	setProperty('camZoomingDecay', 2.5)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 31, 'linear')
end

canBop = false
bopLength = 128
bopLoop = {0, 12, 16, 24, 40, 48, 52, 64, 76, 80, 88, 104, 108, 112, 116}
function onStepHit()
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, (480/curBpm), 'expoOut')
	end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 1024 or curStep == 2048 or curStep == 4096 then
		canBop = true
		cameraFlash('camOther', '34bdeb', (120/curBpm))
		addBloomEffect('camGame', 0.25)
		addBloomEffect('camHUD', 0.25)
	end
	if curStep == 1536 or curStep == 2560 or curStep == 5120 then
		canBop = false
		cameraFlash('camOther', 'ffffff', 0.7)
		clearEffects('camGame')
		clearEffects('camHUD')
	end
	if curStep == 3584 then
		doTweenAlpha('talkSection', 'flash', 0.4, (240/curBpm))
		if doBotShit then setProperty('cpuControlled', true) end
	end
	if curStep == 4096 then
		bopLength = 256
		bopLoop =  {0,12,16,24,36,40,48,52,56,64,72,74,76,80,88,100,104,108,112,120,128,140,144,152,164,168,176,184,192,204,208,216,228,230,232,236,240,244,248,252}
		setProperty('flash.alpha', 0)
		if doBotShit then setProperty('cpuControlled', false) end
	end
	if curStep == 5248 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 24)
	end
	if canBop then
		for i = 0, #bopLoop do
			if curStep % bopLength == bopLoop[i] then
				setProperty('coolCyan.alpha', 1)
				doTweenAlpha('cyanOut', 'coolCyan', 0, (120/curBpm), 'sineOut')
				break
			end
		end
	end
end