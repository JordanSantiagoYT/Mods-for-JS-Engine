function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Postposition (V2)\n\nSong by luxri\n\nChart by Jordan Santiago", 1250, 0, 720)
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
	doTweenAlpha('flashOut', 'flash', 0, 1, 'linear')
end

bopLoop = {0, 4, 8, 11, 14}
function onStepHit()
	if curStep == 16 then
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 48 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 752 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 4, 'linear')
	end

	if curStep >= 432 and curStep < 688 then
		for i = 0, #bopLoop do
			if curStep % 16 == bopLoop[i] then
				if curStep % 16 ~= 0 and curStep % 16 ~= 8 then triggerEvent('Add Camera Zoom', 0.03, 0.06) end
				if shadersEnabled and curStep % 16 ~= 12 then
					setShaderValue('glow', 'glowIntensity', 0.25)
           			doTweenShaderValue("glowOut", "glow", "glowIntensity", 0, 60 / curBpm, 'sineOut')
					setShaderValue('chromSplit', 'aberration', 0.03)
           			doTweenShaderValue("chromOut", "chromSplit", "aberration", 0, 60 / curBpm, 'quadOut')
				end
				setProperty('camTwistIntensity', 4)
				setProperty('camTwistIntensity2', 4)
				runHaxeCode('game.doTwist();')
				break
			end
		end
	end
end