function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "INEVITABLE\n\nSong by stupendouspendy\n\nChart by Jordan Santiago", 1250, -240, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	noteTweenX('oppStrumX0', 0, -200, 1.3, 'expoOut')
	noteTweenX('oppStrumX1', 1, -200, 1.4, 'expoOut')
	noteTweenX('oppStrumX2', 2, -200, 1.5, 'expoOut')
	noteTweenX('oppStrumX3', 3, -200, 1.6, 'expoOut')
	setProperty('dad.alpha', 0)

 	makeLuaText('otherCreds','AVENGED Sprites by Enzo Polis',1200,30,800)
    	setTextSize('otherCreds', 25)
    	addLuaText('otherCreds')
	screenCenter('otherCreds', 'X')

	--be sure to change the 'JS Bambi Fansong Charts' part if you use this in other songs! (creds to NRSM and TheLeerName)
    	if not shadersEnabled then return end
    	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
    	initShaderHandler()
    	initLuaShader("chromSplit")
    	initLuaShader("glow")
    	initLuaShader("gray")
	addShadersOnCamera("camHUD",  {"gray", "chromSplit", "glow"})
	addShadersOnCamera("camGame", {"gray", "chromSplit", "glow"})
end

allowEffects = false
bopSpeed = 8
function onStepHit()
	if curStep == 64 then
		doTweenAlpha('flashOut', 'flash', 0.4, 22, 'linear')
	end
	if curStep == 316 then
		doTweenAlpha('fadeOut', 'flash', 1, 0.4, 'linear')
	end
	if curStep == 344 then
		doTweenAlpha('fadeOut', 'flash', 0.7, 0.4, 'linear')
	end
	if curStep == 350 or curStep == 1149 or curStep == 1726 then allowEffects = true end
	if curStep == 352 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 416 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 608 or curStep == 1408 then
		doTweenAlpha('dadIn', 'dad', 0.4, (240/curBpm) * 1.5)
		backStrums()
	end
	if curStep == 622 or curStep == 1424 then
		bopSpeed = 1
		noteTweenX('bfStrumX', 4, 1400, 0.8, 'quartInOut')
		noteTweenX('bfStrumX1', 5, 1400, 0.9, 'quartInOut')
		noteTweenX('bfStrumX2', 6, 1400, 1.0, 'quartInOut')
		noteTweenX('bfStrumX3', 7, 1400, 1.1, 'quartInOut')
		noteTweenX('oppStrumX0', 0, 415, 1.8, 'expoOut')
		noteTweenX('oppStrumX1', 1, 525, 1.8, 'expoOut')
		noteTweenX('oppStrumX2', 2, 635, 1.8, 'expoOut')
		noteTweenX('oppStrumX3', 3, 745, 1.8, 'expoOut')
	end
	if curStep == 640 or curStep == 1440 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('dad.alpha', 1)
		if curStep ~= 1440 then doTweenY('NewCreditTween', 'otherCreds', 560, 2, 'expoOut') end
	end
	if curStep == 688 or curStep == 960 then
		doTweenY('NewCreditBye', 'otherCreds', 800, 2, 'expoIn')
	end
	if curStep == 880 or curStep == 1672 then
		backStrums()
	end
	if curStep == 896 then
		noteTweenX('oppStrumX0', 0, -200, 1.3, 'expoOut')
		noteTweenX('oppStrumX1', 1, -200, 1.4, 'expoOut')
		noteTweenX('oppStrumX2', 2, -200, 1.5, 'expoOut')
		noteTweenX('oppStrumX3', 3, -200, 1.6, 'expoOut')
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('dad.alpha', 0)
		setShaderValue('gray', 'grayIntensity', 1)
		allowEffects = false
		bopSpeed = 2
		setTextString('otherCreds', 'Sad BF sprites from Cyber Sensation: Malware Breakout')
		screenCenter('otherCreds', 'X')
		doTweenY('NewCreditTween', 'otherCreds', 560, 2, 'expoOut')
	end
	if curStep == 1120 then
           	doTweenShaderValue("graySlightOut", "gray", "grayIntensity", 0.4, (240 / curBpm) * 1.8, 'sineOut')
	end
	if curStep == 1152 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setShaderValue('gray', 'grayIntensity', 0)
	end
	if curStep == 1406 then
		effectBop = 4
	end
	if curStep == 1694 then allowEffects = false end
	if curStep == 1952 then
		allowEffects = false
		cameraFlash('camOther', 'ffffff', 0.7)
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 1)
		for i=0, getProperty('opponentStrums.length')-1 do
			noteTweenAlpha('noteFade'..i, i, 0.2, 0.8)
		end
		doTweenAlpha('dadFade', 'dad', 0.2, 0.8)
	end
	if curStep == 1984 then
		cameraFlash('camOther', '000000', 0.7)
		setProperty('flash.alpha', 0)
		setObjectCamera('flash', 'camOther')
		setShaderValue('gray', 'grayIntensity', 1)
		--setProperty('dad.alpha', 0.2)
	end
	if curStep == 2240 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenAlpha('byeDad', 'dad', 0, 3)
		for i=0, getProperty('opponentStrums.length')-1 do
			noteTweenX('oppStrumX'..i, i, -200, 3, 'expoIn')
		end
	end
	if curStep == 2304 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 14, 'expoOut')
		for i=0, getProperty('opponentStrums.length') do
			noteTweenAlpha('noteFade'..i, i, 1, 0.8)
		end
	end

	if allowEffects then
		if curStep % (4 * bopSpeed) == 0 then
			if shadersEnabled then
				setShaderValue('glow', 'glowIntensity', 0.25)
           			doTweenShaderValue("glowOut", "glow", "glowIntensity", 0, ((bopSpeed >= 4 and 240 or 60) / curBpm), 'sineOut')
				setShaderValue('chromSplit', 'aberration', 0.03)
           			doTweenShaderValue("chromOut", "chromSplit", "aberration", 0, ((bopSpeed >= 4 and 240 or 60) / curBpm), 'quadOut')
			end
		end
	end
end

function backStrums()
	noteTweenX('oppStrumBack0', 0, defaultOpponentStrumX0, 0.6, 'expoOut')
	noteTweenX('oppStrumBack1', 1, defaultOpponentStrumX1, 0.6, 'expoOut')
	noteTweenX('oppStrumBack2', 2, defaultOpponentStrumX2, 0.6, 'expoOut')
	noteTweenX('oppStrumBack3', 3, defaultOpponentStrumX3, 0.6, 'expoOut')
	noteTweenX('bfStrumBack0', 4, defaultPlayerStrumX0, 0.6, 'expoOut')
	noteTweenX('bfStrumBack1', 5, defaultPlayerStrumX1, 0.6, 'expoOut')
	noteTweenX('bfStrumBack2', 6, defaultPlayerStrumX2, 0.6, 'expoOut')
	noteTweenX('bfStrumBack3', 7, defaultPlayerStrumX3, 0.6, 'expoOut')
end