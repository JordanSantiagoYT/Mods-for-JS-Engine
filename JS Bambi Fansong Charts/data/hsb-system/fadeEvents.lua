function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "HSB SYSTEM\n\nSong by Lighter702\n\nChart by Jordan Santiago\n\nWARNING: Flashing Lights + Eyesores", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

    	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
    	initShaderHandler()
    	initLuaShader("chrom")
    	initLuaShader("glow")
	initLuaShader("adjustColor")
	addShadersOnCamera("camHUD",  {"adjustColor", "chrom", "glow"})
	addShadersOnCamera("camGame", {"adjustColor", "chrom", "glow"})
end

function onSongStart()
	doTweenAlpha('flashOut', 'flash', 0, 32, 'linear')
end

allowEffects = false
coolPart = false
rainbowSpeed = 16
beatBop = 4
function onStepHit()
	if curStep == 1023 or curStep == 4095 then allowEffects = true end
	if curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 0.7)
		cameraFade('camGame', 'ffffff', 1.1, true, true)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 1152 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 2048 or curStep == 5120 then
		cameraFlash('camOther', 'ffffff', 0.7)
		coolPart = true
		doRainbow()
	end
	if curStep == 3072 then
		coolPart = false
		allowEffects = false
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		cancelTween('hueOut')
	end
	if curStep == 992 or curStep == 6112 then
		cameraFade('camGame', 'ffffff', 1.1)
	end
	if curStep == 6144 then
		cameraFade('camGame', 'ffffff', 0.7, false, true)
		rainbowSpeed = 8
		beatBop = 2
		doRainbow()
	end
	if curStep == 8192 then
		cameraFlash('camOther', 'ffffff', 0.7)
		rainbowSpeed = 8
		allowEffects = false
		doRainbow()
	end
	if curStep == 8736 then
		doTweenAlpha('flIn', 'flash', 1, 1.1, 'linear')
	end
	if curStep == 8768 then
		doTweenAlpha('flIn', 'flash', 1, 1.1, 'linear')
		rainbowSpeed = 16
		allowEffects = false
		coolPart = false
	end
end

function onBeatHit()
	if allowEffects and curBeat % beatBop == 0 then
		setShaderValue('glow', 'glowIntensity', 0.25)
           	doTweenShaderValue("glowOut", "glow", "glowIntensity", 0, (60 / curBpm) * beatBop, 'quadOut')
		setShaderValue('chrom', 'aberration', 0.015)
           	doTweenShaderValue("chromOut", "chrom", "aberration", 0, (60 / curBpm) * beatBop, 'quadOut')

	end
	if curBeat > 256 and curBeat < 507 or curBeat > 512 and curBeat < 768 or curBeat > 1024 and curBeat < 2048 then
		if curBeat < 1536 and curBeat % 8 == 4 or curBeat > 1536 and curBeat % 2 == 0 then
			setProperty('camTwistIntensity', 4)
			setProperty('camTwistIntensity2', 4)
			runHaxeCode('game.doTwist();')
		end
	end
	if coolPart and curBeat % rainbowSpeed == 0 then
		doRainbow()
	end
end

function doRainbow()
	setShaderValue('adjustColor', 'hue', 0)
        doTweenShaderValue("hueOut", "adjustColor", "hue", 360, (60/curBpm) * rainbowSpeed, 'linear')
end