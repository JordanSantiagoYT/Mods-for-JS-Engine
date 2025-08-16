local anchorpos = {};
local dripMode = true
function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Fuming (Drip Remix)\n\nSong by Null_y34r (Remix by Nxst3to)\n\nChart by Jordan Santiago", 1250, 0, 720)
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

	if difficultyName ~= 'Drip' then
		setTextString('Credits', 'Fuming\n\nSong by Null_y34r\n\nChart by Jordan Santiago')
		dripMode = false
	end

	--be sure to change the 'JS Bambi Fansong Charts' part if you use this in other songs! (creds to NRSM and TheLeerName)
    	if not shadersEnabled then return end
    	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
    	initShaderHandler()
    	initLuaShader("chromSplit")
    	initLuaShader("glow")
    	initLuaShader("gray")
	addShadersOnCamera("camHUD",  {"gray", "chromSplit", "glow"})
	addShadersOnCamera("camGame", {"gray", "chromSplit", "glow"})

        for i = 0,getProperty('strumLineNotes.length')-1 do 
            xshake = getPropertyFromGroup('strumLineNotes', i, 'x')
            yshake = getPropertyFromGroup('strumLineNotes', i, 'y')
            table.insert(anchorpos, {xshake,yshake})
        end
end

function onSongStart()
	setProperty('camZoomingDecay', 2)
	doTweenAlpha('flTw', 'flash', 0, 8, 'linear')
end

canBop = false
canTwist = true
allowEffectBop = false
bopLoop = {0, 8, 16, 20, 24}
bopLoop2 = {0, 6, 8, 12, 20, 24, 26}
bopLoop3 = {0, 6, 8, 12, 18, 20, 24, 26, 30}
bopSimple = {0, 4, 8, 12, 16, 20, 24, 28}
bopLoopFinal = {0, 8, 20, 24, 26}

blToDo = {}
local twistValues = {[8] = true, [18] = true, [24] = true, [30] = true}

function onStepHit()
	if curStep == 128 and dripMode then
		blToDo = bopLoop
		allowEffectBop = true
		canBop = true
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 496 then
		canBop = false
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 1, 0.6, 'expoOut')
	end
	if curStep == 568 then
		doTweenAlpha('fadeOut', 'flash', 1, 0.5, 'linear')
	end
	if curStep == 576 then
		blToDo = bopLoop2
		allowEffectBop = true
		canBop = true
		setShaderValue('gray', 'grayIntensity', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 640 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1072 then canBop = false end
	if curStep == 1088 then
		canBop = true
		blToDo = bopLoop3
	end
	if curStep == 1600 then
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 1, 0.6, 'expoOut')
		canBop = false
	end
	if curStep == 1656 then
		doTweenAlpha('fadeOut', 'flash', 1, 0.28, 'linear')
	end
	if curStep == 1664 then
		blToDo = bopLoop2
		allowEffectBop = true
		canBop = true
		setShaderValue('gray', 'grayIntensity', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 1920 then
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 1, 0.6, 'linear')
	end
	if curStep == 1936 then
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 0, 0.2, 'linear')
	end
	if curStep == 2176 then
		canTwist = false
		blToDo = bopSimple
	end
	if curStep == 2208 then
		doTweenX('toBamb', 'camFollow', 400, 2, 'quartInOut')
		doTweenY('toBamb2', 'camFollow', 660, 2, 'quartInOut')
	end
	if curStep == 2240 then
		canTwist = true
		blToDo = bopLoop2
		setProperty('shakeAmt.x', 8)
	end
	if curStep == 2752 then
		doTweenX('shakeOut', 'shakeAmt', 0, 1.11, 'quadOut')
		blToDo = bopLoopFinal
	end
	if curStep == 3264 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
		canBop = false
	end
	if canBop and dripMode then
		for i = 0, #blToDo do
			if curStep % 32 == blToDo[i] then
				if curStep % 32 ~= 0 and curStep % 32 ~= 16 then triggerEvent('Add Camera Zoom', 0.06, 0.12) end
				if allowEffectBop then
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
				if not twistValues[blToDo[i]] and curStep > 2240 and curStep < 2752 then
					setProperty('redVig.alpha', 1)
					doTweenAlpha('vigOut', 'redVig', 0, 0.3, 'linear')
				end
				break
			end
		end
	end
end

shake = 0
function onUpdate(elapsed)
	if getProperty('shakeAmt.x') > 0 then
		shake = getProperty('shakeAmt.x')
		for i = 0,getProperty('strumLineNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
			setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
		end
		else if curStep == 2768 then
			for i = 0,getProperty('strumLineNotes.length')-1 do
				setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1])
				setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2])
			end
		end
	end
end