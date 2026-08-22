local anchorpos = {};
local dadPos = {};
local uhoh = false;

function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Scopomania (Retake)\n\nSong by floweytheflowerlol\n\nChart by Jordan Santiago\n\nOpp Sprites by Enzo Polis\n\nBF Sprites from Super Funkin' Galaxy", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 32)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	makeLuaSprite('shakeAmt', '', 0, 0);
	setProperty('shakeAmt.visible',false)
  	addLuaSprite('shakeAmt',false);

	makeLuaSprite('redVig', 'redvignette', 0, 0);
	addLuaSprite('redVig', true);
	setLuaSpriteScrollFactor('redVig', 0, 0)
	setProperty('redVig.alpha', 0)
	setObjectCamera('redVig', 'camHUD')

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
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 8, 'linear')
	setProperty('defaultCamZoom', 1)
end

canChrom = false
canBop = false
effectBop = 0.25
bopSpeed = 16
offset = 8
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
	if curStep == 894 then
		bopSpeed = 8
	end
	if curStep == 1016 then bopSpeed = 16 end
	if curStep == 1142 then canBop = false end
	if curStep == 1151 then
		canBop = true
		canChrom = true
		bopSpeed = 4
		offset = 0
	end
	if curStep == 1278 then
		bopSpeed = 8
	end
	if curStep == 1288 then
		uhoh = true
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('shakeAmt.x', 8)
		effectBop = 0.35
	end
	if curStep == 1776 then
		bopSpeed = 4
	end
	if curStep == 1790 then
		canChrom = false
		bopSpeed = 16
		offset = 8
	end
	if curStep == 1792 then
		setProperty('shakeAmt.x', 0)
		uhoh = false
		doTweenAlpha('vigBye', 'redVig', 0, (240/curBpm))
		effectBop = 0.25
	end
	if curStep == 2174 then canBop = false end
	if curStep == 2304 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm), 'linear')
	end
	if canBop and bopSpeed > 0 then
		if (curStep - offset) % bopSpeed == 0 then
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
shaking = false
function onUpdate(elapsed)
	if getProperty('shakeAmt.x') > 0 then
		shaking = true
		shake = getProperty('shakeAmt.x')
		for i = 0,getProperty('strumLineNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
			setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
		end
	elseif shaking then
		shaking = false
		for i = 0,getProperty('strumLineNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1])
			setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2])
		end
	end
	if uhoh then
		setProperty('redVig.alpha', 0.6 + 0.4 * math.sin((curDecBeat / 4) * math.pi));
	end
end