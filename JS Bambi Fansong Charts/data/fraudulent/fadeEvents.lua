function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Fraudulent\n\nSong by Natsitu\n\nChart by Jordan Santiago\n\nOpponent Sprites by Xaura404", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 36)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('ytWatermark.alpha', 0)

    	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
    	initShaderHandler()
    	initLuaShader("chromSplit")
    	initLuaShader("glow")
    	initLuaShader("gray")
	addShadersOnCamera("camHUD",  {"gray", "chromSplit", "glow"})
	addShadersOnCamera("camGame", {"gray", "chromSplit", "glow"})
	setShaderValue('gray', 'grayIntensity', 1)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 8, 'linear')
end

bopLoop = {}
bopLength = 64
effectSpeed = 8
effectsAllowed = false
function onStepHit()
	if curStep == 368 then
		doTweenShaderValue('grayOut', 'gray', 'grayIntensity', 0.4, (200/curBpm), 'expoIn')
	end
	if curStep == 384 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, (480/curBpm), 'expoOut')
		setProperty('flash.alpha', 0)
		setShaderValue('gray', 'grayIntensity', 0)
		effectsAllowed = true
		bopLoop = {0,12,24,32,44,52,58}
	end
	if curStep == 432 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 448 then
		bopLoop = {0,12,20,26,32,38,44}
	end
	if curStep == 496 or curStep == 886 or curStep == 1018 or curStep == 2224 or curStep == 2632 or curStep == 2760 then effectsAllowed = false end
	if curStep == 768 or curStep == 2512 then
		effectsAllowed = true
		bopLoop = {0,4,8,12,16,20,24,28,30,32,36,40,44,48,52,56,58,60,62}
		bopLength = 64
		effectSpeed = 4
		if curStep == 768 then
			noteTweenX('opp0', 0, -200, 0.8, 'expoOut')
			noteTweenX('opp1', 1, -200, 0.9, 'expoOut')
			noteTweenX('opp2', 2, -200, 1.0, 'expoOut')
			noteTweenX('opp3', 3, -200, 1.1, 'expoOut')
			noteTweenX('bfStrumX', 4, 415, 1.3, 'expoOut')
			noteTweenX('bfStrumX1', 5, 525, 1.4, 'expoOut')
			noteTweenX('bfStrumX2', 6, 635, 1.5, 'expoOut')
			noteTweenX('bfStrumX3', 7, 745, 1.6, 'expoOut')
		else
			for i=1, #bopLoop do
				bopLoop[i] = (bopLoop[i] + 16) % bopLength
			end
		end
	end
	if curStep == 896 or curStep == 2640 then
		effectsAllowed = true
		noteTweenX('oppStrumBack0', 0, defaultOpponentStrumX0, 0.6, 'expoOut')
		noteTweenX('oppStrumBack1', 1, defaultOpponentStrumX1, 0.6, 'expoOut')
		noteTweenX('oppStrumBack2', 2, defaultOpponentStrumX2, 0.6, 'expoOut')
		noteTweenX('oppStrumBack3', 3, defaultOpponentStrumX3, 0.6, 'expoOut')
		noteTweenX('bfStrumBack0', 4, defaultPlayerStrumX0, 0.6, 'expoOut')
		noteTweenX('bfStrumBack1', 5, defaultPlayerStrumX1, 0.6, 'expoOut')
		noteTweenX('bfStrumBack2', 6, defaultPlayerStrumX2, 0.6, 'expoOut')
		noteTweenX('bfStrumBack3', 7, defaultPlayerStrumX3, 0.6, 'expoOut')
	end
	if curStep == 1020 then
		setObjectCamera('flash', 'camGame')
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 1, (60/curBpm), 'expoIn')
		doTweenAlpha('gameCover', 'flash', 1, (60/curBpm))
	end
	if curStep == 1024 then
		doTweenShaderValue('grayOff', 'gray', 'grayIntensity', 0, (240/curBpm) * 6, 'expoIn')
		doTweenAlpha('gameFadeOut', 'flash', 0, (240/curBpm) * 6)
	end
	if curStep == 1532 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('fadeLol', 'flash', 1, (60/curBpm), 'linear')
	end
	if curStep == 1596 then
		doTweenAlpha('whoa', 'flash', 0, (120/curBpm), 'expoInOut')
	end
	if curStep == 1848 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('gameCover', 'flash', 1, (120/curBpm))
	end
	if curStep == 1872 then
		doTweenAlpha('gameCoverOut', 'flash', 0, (120/curBpm))
	end
	if curStep == 2000 then
		effectsAllowed = true
		bopLoop = {16,22,28}
		bopLength = 32
		effectSpeed = 8
	end
	if curStep == 2096 then
		bopLoop = {0,6,20,26}
		bopLength = 32
		effectSpeed = 8
	end
	if curStep == 2128 then
		bopLoop = {0,6,12}
		bopLength = 16
		effectSpeed = 6
	end
	if curStep == 2512 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 2760 then
		setObjectCamera('flash', 'camOther')
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 0.7, (60/curBpm), 'linear')
	end
	if curStep == 2764 then
		doTweenShaderValue('grayOff2', 'gray', 'grayIntensity', 0, (120/curBpm), 'expoInOut')
	end
	if curStep == 3088 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 4, 'linear')
	end
	if #bopLoop > 0 and effectsAllowed then
		for i = 0, #bopLoop do
			if curStep % bopLength == bopLoop[i] then
				if curStep % (getProperty('camBopInterval') * 4) ~= 0 then triggerEvent('Add Camera Zoom', 0.03, 0.06) end
				setShaderValue('glow', 'glowIntensity', 0.25)
           			doTweenShaderValue("glowOut", "glow", "glowIntensity", 0, (15*effectSpeed) / curBpm, 'sineOut')
				setShaderValue('chromSplit', 'aberration', 0.03)
           			doTweenShaderValue("chromOut", "chromSplit", "aberration", 0, (15*effectSpeed) / curBpm, 'quadOut')
				break
			end
		end
	end
end

function onEvent(n, v1, v2)
end