function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Cornfused\n\nSong by BobbbyOfficial\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaSprite('redVig', 'redvignette', 0, 0);
	addLuaSprite('redVig', true);
	setLuaSpriteScrollFactor('redVig', 0, 0)
	setProperty('redVig.alpha', 0)
	setObjectCamera('redVig', 'camHUD')

	makeLuaSprite('shakeAmt', '', 0, 0);
	setProperty('shakeAmt.visible',false)
  	addLuaSprite('shakeAmt',false);

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

function onSongStart()
	setProperty('camZoomingDecay', 4)
	doTweenAlpha('flTw', 'flash', 0, 8, 'linear')
end

canBop = false
canTwist = true
allowEffectBop = false
bopLoop = {0, 4, 8, 11, 12, 14, 16, 20, 24, 27, 28, 30}
bopLoop2 = {0, 8, 16, 24, 28}

function onSongStart()
	setProperty('camZoomingDecay', 4)
	doTweenAlpha('flTw', 'flash', 0, 0.01, 'linear')
	blToDo = bopLoop
	allowEffectBop = true
	canBop = true
	cameraFlash('camOther', 'ffffff', 0.7)
end

blToDo = {}
local twistValues = {[4] = true, [12] = true, [20] = true, [28] = true}

function onStepHit()
	if curStep == 119 or curStep == 254 or curStep == 767 or curStep == 1535 or curStep == 1686 then
		canBop = false
	end
	if curStep == 128 then
		canBop = true
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 192 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 383 or curStep == 895 or curStep == 1567 then canBop = true end
	if curStep == 639 then blToDo = bopLoop2 end
	if curStep == 896 then blToDo = bopLoop end
	if curStep == 1696 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 1)
	end
	if curStep == 1708 then
		doTweenAlpha('byeHUD', 'camHUD', 0.001, 0.34, 'linear')
	end
	if canBop then
		for i = 0, #blToDo do
			if curStep % 32 == blToDo[i] then
				if curStep % 32 ~= 0 and curStep % 32 ~= 16 then triggerEvent('Add Camera Zoom', 0.06, 0.12) end
				if allowEffectBop and curStep % 16 ~= 12 then
					setShaderValue('glow', 'glowIntensity', 0.25)
           			doTweenShaderValue("glowOut", "glow", "glowIntensity", 0, 60 / curBpm, 'sineOut')
					setShaderValue('chromSplit', 'aberration', 0.03)
           			doTweenShaderValue("chromOut", "chromSplit", "aberration", 0, 60 / curBpm, 'quadOut')
				end
				if twistValues[blToDo[i]] and canTwist then
					setProperty('camTwistIntensity', 4)
					setProperty('camTwistIntensity2', 4)
					runHaxeCode('game.doTwist();')
				end
				break
			end
		end
	end
end