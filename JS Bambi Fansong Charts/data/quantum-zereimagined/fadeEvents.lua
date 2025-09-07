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

	makeLuaText('Credits', "Quantum (ZEREIMAGINED)\n\nSong by RealZerenaFan\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('camZoomingDecay', 2)

	--be sure to change the 'JS Bambi Fansong Charts' part if you use this in other songs! (creds to NRSM and TheLeerName)
    	if not shadersEnabled then return end
    	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
    	initShaderHandler()
    	initLuaShader("chromSplit")
    	initLuaShader("glow")
	addShadersOnCamera("camHUD",  {"chromSplit", "glow"})
	addShadersOnCamera("camGame", {"chromSplit", "glow"})
end

function onSongStart()
	doTweenAlpha('flashOut', 'flash', 0, 23, 'linear')
end

allowEffects = false
effectDecay = 1
bopSpeed = 8
function onStepHit()
	if curStep == 240 then
		doTweenAlpha('fadeOut1', 'flash', 1, 1.2)
	end
	if curStep == 254 then
		doTweenAlpha('fadeIn1', 'flash', 0, 0.2)
	end
	if curStep == 256 then
		allowEffects = true
		effectDecay = 2
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 464 or curStep == 720 or curStep == 1616 then
		doTweenAlpha('fadeOut2', 'flash', 0.5, (240/curBpm) * 2)
	end
	if curStep == 504 or curStep == 760 or curStep == 1656 then
		doTweenAlpha('fadeIn2', 'flash', 0, (120/curBpm))
	end
	if curStep == 512 or curStep == 1664 then
		bopSpeed = 4
		effectDecay = 1
	end
	if curStep == 896 then
		bopSpeed = 8
		effectDecay = 2
	end
	if curStep == 1152 or curStep == 2048 then
		allowEffects = false
	end
	if curStep == 1280 then
		doTweenAlpha('fadeOut', 'flash', 0.95, (240/curBpm) * 8, 'linear')
	end
	if curStep == 1408 then
		doTweenAlpha('fadeOut', 'flash', 0, (240/curBpm) * 8, 'linear')
		cameraFlash('camGame', '000000', 0.7)
	end
	if curStep == 1535 then allowEffects = true end
	if curStep == 2560 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenAlpha('fadeOut', 'flash', 1, (240/150) * 16, 'linear')
	end

	if allowEffects and shadersEnabled then
		if curStep % bopSpeed == 0 then
			setShaderValue('glow', 'glowIntensity', 0.25)
			doTweenShaderValue("glowOut", "glow", "glowIntensity", 0, (60/curBpm) * effectDecay, 'sineOut')
			setShaderValue('chromSplit', 'aberration', 0.03)
			doTweenShaderValue("chromOut", "chromSplit", "aberration", 0, (60/curBpm) * effectDecay, 'quadOut')
		end
	end
end