function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Nihility (TimeLaserz Remix)\n\nSong by TimeLaserz\n\nChart by Jordan Santiago\n\nSprites by oriiien", 1250, 0, 720)
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
    	initLuaShader("gray")
	addShadersOnCamera("camHUD",  {"gray", "chrom"})
	addShadersOnCamera("camGame", {"gray", "chrom"})
	setShaderValue('gray', 'grayIntensity', 1)
end

function onSongStart()
	setProperty('camZoomingDecay', 2)
	doTweenAlpha('flTw', 'flash', 0, 6, 'linear')
end

allowEffectBop = false

function onStepHit()
	if curStep == 504 then
		doTweenShaderValue('graything', 'gray', 'grayIntensity', 0, 0.46, 'linear')
	end
	if curStep == 512 then
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1504 then
		doTweenShaderValue('graything2', 'gray', 'grayIntensity', 1, 1.8, 'linear')
		doTweenAlpha('flashIn', 'flash', 1, 1.8, 'expoIn')
	end
	if curStep == 1536 then
		doTweenAlpha('flashOut', 'flash', 0, 8, 'linear')
	end
	if curStep == 1792 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setShaderValue('gray', 'grayIntensity', 0)
		setProperty('flash.alpha', 0)
	end
	if curStep == 2048 then
		allowEffectBop = true
	end
	if curStep == 2560 then
		allowEffectBop = false
	end
	if curStep == 2816 then
		doTweenAlpha('flTw', 'flash', 1, 16, 'linear')
	end
end

function onBeatHit()
	if allowEffectBop and curBeat % 2 == 1 then
		setShaderValue('chrom', 'aberration', 0.02)
           	doTweenShaderValue("chromOut", "chrom", "aberration", 0, 100 / curBpm, 'quadOut')
	end
end