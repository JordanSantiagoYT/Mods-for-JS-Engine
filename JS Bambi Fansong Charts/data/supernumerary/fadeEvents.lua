function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Supernumerary\n\nSong by TrueSimplex\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	setProperty('dad.alpha', 0)

	--be sure to change the 'JS Bambi Fansong Charts' part if you use this in other songs! (creds to NRSM and TheLeerName)
    	if not shadersEnabled then return end
    	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
    	initShaderHandler()
    	initLuaShader("glow")
    	initLuaShader("gray")
	addShadersOnCamera("camHUD",  {"gray", "glow"})
	addShadersOnCamera("camGame", {"gray", "glow"})
end

function onSongStart()
	setProperty('camZoomingDecay', 2)
	doTweenAlpha('flTw', 'flash', 0, 6, 'linear')
end

allowEffectBop = false

function onStepHit()
	if curStep == 120 then
		doTweenAlpha('flTw', 'flash', 1, 0.5, 'linear')
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 1, 0.5, 'linear')
	end
	if curStep == 128 then
		setProperty('dad.alpha', 1)
		doTweenAlpha('flTw', 'flash', 0.2, 8.3, 'linear')
		doTweenShaderValue('grayOut', 'gray', 'grayIntensity', 0, 8.3, 'linear')
	end
	if curStep == 242 then
		doTweenAlpha('flTw', 'flash', 1, 0.4, 'linear')
	end
	if curStep == 248 then
		doTweenAlpha('flTw', 'flash', 0, 0.5, 'linear')
	end
	if curStep == 256 then
		allowEffectBop = true
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 496 or curStep == 752 then
		allowEffectBop = false
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 1, 0.6, 'expoOut')
	end
	if curStep == 504 or curStep == 760 then
		doTweenShaderValue('grayOut', 'gray', 'grayIntensity', 0, 0.6, 'expoIn')
	end
	if curStep == 512 or curStep == 768 or curStep == 1120 or curStep == 1184 or curStep == 1248 or curStep == 1664 then
		allowEffectBop = true
	end
	if curStep == 736 or curStep == 1048 or curStep == 1112 or curStep == 1176 or curStep == 1240 or curStep == 1344 or curStep == 1920 then allowEffectBop = false end
	if curStep == 1392 then
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 1, 1.17, 'expoIn')
		doTweenAngle('gameSpin', 'camGame', 180, 1.17, 'expoIn')
		cameraFade('camOther', 'ffffff', 1.1)
	end
	if curStep == 1408 then
		setProperty('flash.alpha', 1)
		cameraFade('camOther', 'ffffff', 1, false, true)
	end
	if curStep == 1536 then
		doTweenAlpha('flashOut', 'flash', 0, 8, 'linear')
		doTweenAngle('gameBack', 'camGame', 0, 8, 'expoOut')
	end
	if curStep == 1648 then
		cameraFade('camOther', 'ffffff', 1.02)
	end
	if curStep == 1664 then
		cameraFade('camOther', 'ffffff', 1, false, true)
		setShaderValue('gray', 'grayIntensity', 0)
	end
	if curStep == 1920 or curStep == 2048 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 2304 then
		doTweenAlpha('flTw', 'flash', 1, 18.7, 'linear')
	end
end

function onBeatHit()
	if allowEffectBop and (curBeat < 416 and curBeat % 2 == 1 or curBeat > 416 and curBeat % 4 == 2) then
		setShaderValue('glow', 'glowIntensity', 0.25)
           	doTweenShaderValue("glowOut", "glow", "glowIntensity", 0, (curBeat < 416 and 100 or 180) / curBpm, 'sineOut')
	end
end