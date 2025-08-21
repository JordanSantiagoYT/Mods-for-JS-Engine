function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Relinquishing\n\nSong by Monroe14\n\nChart by Jordan Santiago", 1250, 0, 720)
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
    	initLuaShader("gray")
    	initLuaShader("glow")
    	initLuaShader("chromSplit")
	addShadersOnCamera("camHUD",  {"chromSplit", "glow", "gray"})
	addShadersOnCamera("camGame", {"chromSplit", "glow", "gray"})
end

function onSongStart()
	setProperty('camZoomingDecay', 2)
	doTweenAlpha('flashOut', 'flash', 0, 14, 'linear')
end

allowEffects = false
function onStepHit()
	if curStep == 256 then
		allowEffects = true
		effectBop()
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 496 or curStep == 1278 or curStep == 1784 then
		allowEffects = false
	end
	if curStep == 508 then
		allowEffects = true
		effectBop()
		beatBop = 8
	end
	if curStep == 1280 then
		cameraFlash('camOther', '000000', 0.7)
		setProperty('flash.alpha', 0.75)
		setShaderValue('gray', 'grayIntensity', 1)
	end
	if curStep == 1308 then
           	doTweenShaderValue("grayOut", "gray", "grayIntensity", 0, (60 / curBpm), 'quadOut')
		allowEffects = true
		beatBop = 2
	end
	if curStep == 1312 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 1536 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 15, 'linear')
	end
end

beatBop = 2
function onBeatHit()
	if curBeat % beatBop == 0 then
		effectBop()

	end
end

function onEvent(name, v1, v2)
	if name == 'Add Camera Zoom' then
		effectBop()
	end
end

function effectBop()
	if allowEffects then
		setShaderValue('glow', 'glowIntensity', 0.25)
           	doTweenShaderValue("glowOut", "glow", "glowIntensity", 0, (120 / curBpm), 'quadOut')
		setShaderValue('chromSplit', 'aberration', 0.02)
           	doTweenShaderValue("chromOut", "chromSplit", "aberration", 0, (120 / curBpm), 'quadOut')
	end
end