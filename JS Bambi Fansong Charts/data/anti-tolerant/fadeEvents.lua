ogGT = false

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

	makeLuaText('Credits', "Anti-Tolerant\n\nSong by Baimer\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	--be sure to change the 'JS Bambi Fansong Charts' part if you use this in other songs! (creds to NRSM and TheLeerName)
    	if not shadersEnabled then return end
    	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
    	initShaderHandler()
    	initLuaShader("chrom")
    	initLuaShader("glow")
	addShadersOnCamera("camHUD",  {"glow", "chrom"})
	addShadersOnCamera("camGame", {"glow", "chrom"})

    	makeLuaText('gtWarn','Ghost Tapping OFF. Lock in.',1200,30,800)
    	setTextSize('gtWarn', 25)
    	addLuaText('gtWarn')
	screenCenter('gtWarn', 'X')
	ogGT = getPropertyFromClass('ClientPrefs', 'ghostTapping')
end

allowEffectBop = false
effectIntensity = 1

function onStepHit()
	setProperty('camZoomingDecay', 4 / (getProperty('camBopInterval')))
	if curStep == 112 then
		cameraFade('camOther', 'ffffff', 0.6)
	end
	if curStep == 128 then
		cameraFade('camOther', 'ffffff', 0.2, false, true)
		setProperty('flash.alpha', 0)
	end
	if curStep == 704 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 608 or curStep == 2400 then
		cameraFade('camGame', 'ffffff', 1.4)
	end
	if curStep == 640 then
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
		cameraFade('camGame', 'ffffff', 0.3, false, true)
		allowEffectBop = true
	end
	if curStep == 1152 or curStep == 2176 then
		allowEffectBop = false
	end
	if curStep == 1664 then
		cameraFlash('camOther', 'ffffff', 0.7)
		allowEffectBop = true
	end
	if curStep == 2432 then
		cameraFade('camGame', 'ffffff', 0.3, false, true)
		allowEffectBop = true
		effectIntensity = 2
		doTweenY('gtWarning', 'gtWarn', 560, 1, 'expoOut')
		if ogGT == true then
			setPropertyFromClass('ClientPrefs', 'ghostTapping', false);
		end
	end
	if curStep == 2944 then
		cameraFlash('camOther', 'ffffff', 0.7)
		allowEffectBop = false
		effectIntensity = 1
		doTweenY('gtWarning2', 'gtWarn', 860, 2, 'expoIn')
		setPropertyFromClass('ClientPrefs', 'ghostTapping', ogGT);
	end
	if curStep == 3456 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
	end
end

function onBeatHit()
	if allowEffectBop and curBeat % 2 == 0 then
		setShaderValue('glow', 'glowIntensity', 0.25)
           	doTweenShaderValue("glowOut", "glow", "glowIntensity", 0, 100 / curBpm, 'quadOut')
		if effectIntensity == 2 then
			setShaderValue('chrom', 'aberration', 0.02)
           		doTweenShaderValue("chromOut", "chrom", "aberration", 0, 100 / curBpm, 'quadOut')
		end
	end
end