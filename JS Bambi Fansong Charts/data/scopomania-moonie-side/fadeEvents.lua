local anchorpos = {};
local dadPos = {};

function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Scopomania (Moonie Side)\n\nSong by mooniemooni8166\n\nChart by Jordan Santiago\n\nOpp Sprites by Enzo Polis\n\nBF Sprites from Super Funkin' Galaxy", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 32)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	makeLuaSprite('shakeAmt', '', 0, 0);
	setProperty('shakeAmt.visible',false)
  	addLuaSprite('shakeAmt',false);

        for i = 0,getProperty('strumLineNotes.length')-1 do 
            xshake = getPropertyFromGroup('strumLineNotes', i, 'x')
            yshake = getPropertyFromGroup('strumLineNotes', i, 'y')
            table.insert(anchorpos, {xshake,yshake})
        end
	table.insert(dadPos, {getProperty('dad.x'), getProperty('dad.y')})

	setProperty('camZoomingDecay', 2.5)
	setProperty('ytWatermark.alpha', 0)

    	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
    	initShaderHandler()
    	initLuaShader("chromSplit")
    	initLuaShader("glow")
	addShadersOnCamera("camHUD",  {"chromSplit", "glow"})
	addShadersOnCamera("camGame", {"chromSplit", "glow"})
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 4, 'linear')
	setProperty('defaultCamZoom', 1)
end

canChrom = false
canBop = false
effectBop = 0.25
function onStepHit()
	if curStep == 256 then
		setProperty('flash.alpha', 0)
		canBop = true
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 304 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep >= 1280 and curStep < 1792 then
		canChrom = not mustHitSection
	end
	if curStep == 1792 then
		canChrom = true
		setProperty('shakeAmt.x', 5)
		effectBop = 0.35
	end
	if curStep == 2304 then
		canBop = false
		canChrom = false
		setProperty('shakeAmt.x', 0)
		effectBop = 0.25
	end
	if curStep == 2560 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
	if canBop then
		if curStep % 4 == 0 then
			setShaderValue('glow', 'glowIntensity', effectBop)
           		doTweenShaderValue("glowOut", "glow", "glowIntensity", 0, 60 / curBpm, 'sineOut')
			if canChrom then
				setShaderValue('chromSplit', 'aberration', effectBop / 8.333)
           			doTweenShaderValue("chromOut", "chromSplit", "aberration", 0, 60 / curBpm, 'quadOut')
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
		setProperty('dad.x', dadPos[1][1] + math.random(-shake * 4,shake * 4))
		setProperty('dad.y', dadPos[1][2] + math.random(-shake * 4,shake * 4))
	end
end