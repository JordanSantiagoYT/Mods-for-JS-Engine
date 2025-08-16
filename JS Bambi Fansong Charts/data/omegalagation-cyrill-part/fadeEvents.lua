ogDadY = 0
function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "OMEGALAGATION (Cyrill Phase 2 Part)\n\nSong by Bomdu\n\nChart by Jordan Santiago\n\nPerspective BF Sprites from Super Funkin' Galaxy", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	ogDadY = getProperty('dad.y')
	setProperty('dad.y', -1200)

	--be sure to change the 'JS Bambi Fansong Charts' part if you use this in other songs! (creds to NRSM and TheLeerName)
    	if not shadersEnabled then return end
    	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
    	initShaderHandler()
    	initLuaShader("chrom")
    	initLuaShader("glow")
	addShadersOnCamera("camHUD",  {"glow", "chrom"})
	addShadersOnCamera("camGame", {"glow", "chrom"})
end

function onSongStart()
	cameraFlash('camOther', 'ffffff', 0.7)
	setProperty('flash.alpha', 0)
	setProperty('camZoomingDecay', 4)
end

allowEffects = false
canTwist = false
function onStepHit()
	if curStep == 224 then
		doTweenY('dadComes', 'dad', ogDadY, 1.6, 'expoOut')
	end
	if curStep == 256 then
		allowEffects = true
		canTwist = true
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 758 or curStep == 1788 then
		allowEffects = false
		canTwist = false
	end
	if curStep == 768 then
		allowEffects = true
		canTwist = true
	end
	if curStep == 1792 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 2784 then
		doTweenAlpha('flTw', 'flash', 1, (240 / curBpm) * 2, 'linear')
	end
end

function onBeatHit()
	if canTwist then
		if curBeat % 2 == 1 then
			setProperty('camTwistIntensity', 4)
			setProperty('camTwistIntensity2', 4)
			runHaxeCode('game.doTwist();')
			setShaderValue('chrom', 'aberration', 0.02)
           		doTweenShaderValue("chromOut", "chrom", "aberration", 0, 60 / curBpm, 'quadOut')
		end
	end
	if allowEffects then
		setShaderValue('glow', 'glowIntensity', 0.25)
           	doTweenShaderValue("glowOut", "glow", "glowIntensity", 0, 60 / curBpm, 'quadOut')
	end
end