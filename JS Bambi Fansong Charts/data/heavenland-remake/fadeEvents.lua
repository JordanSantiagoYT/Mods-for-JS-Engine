doorStates = {'Open', 'Shut'}
preSongNotes = {'Flashing', 'Creators'}

ogDadPos = {0, 0}
function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaSprite('fadeBG', '', 0, 0);
	makeGraphic('fadeBG', 1, 1, '000000')
	addLuaSprite('fadeBG', true);
	setLuaSpriteScrollFactor('fadeBG', 0, 0)
	setProperty('fadeBG.scale.x', 3840)
	setProperty('fadeBG.scale.y', 2160)
	setProperty('fadeBG.alpha', 0)
	setObjectCamera('fadeBG', 'camGame')
	setObjectOrder('fadeBG', getObjectOrder('boyfriendGroup') - 4)

	for i, note in pairs(preSongNotes) do
		makeLuaSprite(note, 'heavenRemake/'..note, 0, 0);
		addLuaSprite(note, true);
		setLuaSpriteScrollFactor(note, 0, 0)
		scaleObject(note, 1,1)
		setProperty(note..'.alpha', 0)
		if i > 1 then
			scaleObject('Creators', 0.6,0.6)
		end
		setObjectCamera(note, 'camOther')
		screenCenter(note)
        end

	for i, state in pairs(doorStates) do
		makeLuaSprite('door'..state, 'heavenRemake/MysteryDoor'..state, 0, 0);
		addLuaSprite('door'..state, true);
		setLuaSpriteScrollFactor('door'..state, 0, 0)
		scaleObject('door'..state, 3,3)
		setProperty('door'..state..'.alpha', 0)
		setObjectCamera('door'..state, 'camOther')
		screenCenter('door'..state)
		setProperty('door'..state..'.y', -50)
        end

	makeLuaText('Credits', "Heavenland (Remake)\n\nSong by warlokk28 and ush\n\nChart by Jordan Santiago\n\nOpponent Sprites by Enzo Polis", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 36)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('dad.danceEveryNumBeats', 2)
	ogDadPos = {getProperty('dad.x'), getProperty('dad.y')}

	setProperty('dad.y', 900)
	setProperty('dad.x', -1600)
	setProperty('dad.angle', -40)

    	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
    	initShaderHandler()
    	initLuaShader("chromSplit")
    	initLuaShader("GlitchyDisplay")
    	initLuaShader("glow")
    	initLuaShader("pixelation")
	addShadersOnCamera("camHUD",  {"chromSplit", "GlitchyDisplay", 'pixelation'})
	addShadersOnCamera("camGame", {"chromSplit", "glow", "GlitchyDisplay", 'pixelation'})
	setShaderValue('pixelation', 'pixelSize', 0)
	setShaderValue('GlitchyDisplay', 'dist', 0)
	setShaderValue('GlitchyDisplay', 'pi', 1)
	setShaderValue('glow', 'glowIntensity', 0.15)

	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 6, 'expoIn')
	doTweenAlpha('note1', 'Flashing', 1, (240/curBpm) * 1.5, 'quartOut')
end

bopLoop = {}
bopLength = 16
effectSpeed = 8
effectsAllowed = false
oppSwing = false
opTwisted = false
function onStepHit()
	if curStep == 24 then
		doTweenAlpha('note1Out', 'Flashing', 0, (120/curBpm), 'quartIn')
	end
	if curStep == 32 then
		doTweenAlpha('note2', 'Creators', 1, (240/curBpm) * 1.5, 'quartOut')
	end
	if curStep == 64 then
		doTweenAlpha('note2Out', 'Creators', 0, (240/curBpm), 'quartIn')
	end
	if curStep == 127 then
		doTweenX('oppComing', 'camFollow', 0, (480/curBpm), 'expoOut')
		doTweenY('oppComing2', 'camFollow', 400, (480/curBpm), 'expoOut')
		doTweenX('hesComing', 'dad', ogDadPos[1], (480/curBpm), 'expoOut')
		doTweenY('hesComing2', 'dad', ogDadPos[2], (480/curBpm), 'expoOut')
		doTweenAngle('dadTurn', 'dad', 0, (480/curBpm), 'quartOut')
	end
	if curStep == 368 then
		doTweenAlpha('bgBlacken', 'fadeBG', 0.6, (120/curBpm), 'sineOut')
	end
	if curStep == 384 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
		setProperty('flash.alpha', 0)
		effectsAllowed = true
		bopLoop = {4, 12}
		setProperty('fadeBG.alpha', 0)
		runHaxeCode("setVar('sceneNum', 2);")
	end
	if curStep == 432 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 640 then
		oppSwing = true
		bopLoop = {8}
		twistOp(true)
	end
	if curStep == 892 or curStep == 1132 or curStep == 1408 then
		oppSwing = false
		effectsAllowed = false
		bopLoop = {4, 12}
	end
	if curStep == 894 or curStep == 1134 then
		doTweenAngle('oppSwingReset', 'dad', 0, (30/curBpm), 'quintIn')
	end
	if curStep == 911 or curStep == 1039 then
		doTweenAlpha('what1', 'flash', 1, (15/curBpm), 'linear')
	end
	if curStep == 912 or curStep == 1040 then
		doTweenAlpha('what2', 'flash', 0, (120/curBpm), 'expoOut')
	end
	if curStep == 1024 then
		oppSwing = true
		twistOp(true)
	end
	if curStep == 1152 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 1168 then
		effectsAllowed = true
	end
	if curStep == 1214 or curStep == 1278 then
		doTweenShaderValue("GoGoGadgetPixelReducer", "pixelation", "pixelSize", 40, 25 / curBpm, 'quintOut')
	end
	if curStep == 1216 or curStep == 1280 then
		setShaderValue('pixelation', 'pixelSize', 0)
	end
	if curStep == 1440 then
		cameraFlash('camOther', 'ffffff', 0.7)
		runHaxeCode("setVar('sceneNum', 1);")
	end
	if curStep == 1568 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 7, 'quartIn')
	end
	if curStep == 1680 then
		setProperty('doorShut.alpha', 0)
		doTweenAlpha('doorShow', 'doorOpen', 1, (120/curBpm), 'quartIn')
		doTweenScale('doorShrink1', 'doorOpen', 2.5, (240/curBpm) * 6, 'quartOut')
		doTweenScale('doorShrink2', 'doorShut', 2.5, (240/curBpm) * 6, 'quartOut')
	end
	if curStep == 1696 then
		setProperty('doorOpen.alpha', 0)
		setProperty('doorShut.alpha', 1)
		doTweenAlpha('doorFadeOut', 'doorShut', 0, (240/curBpm) * 6, 'linear')
	end
	if #bopLoop > 0 and effectsAllowed then
		for i = 0, #bopLoop do
			if curStep % bopLength == bopLoop[i] then
				setShaderValue('GlitchyDisplay', 'dist', 0.5)
           			doTweenShaderValue("glowOut", "GlitchyDisplay", "dist", 0, (15*effectSpeed) / curBpm, 'quintOut')
				setShaderValue('chromSplit', 'aberration', 0.03)
           			doTweenShaderValue("chromOut", "chromSplit", "aberration", 0, (15*effectSpeed) / curBpm, 'quadOut')
				break
			end
		end
	end
	if oppSwing and curStep % 4 == 2 then
		twistOp()
	end
end

function twistOp(started)
	doTweenAngle('oppSwinging', 'dad', -5 * (opTwisted and 1 or -1), ((started and 30 or 60)/curBpm), 'quintInOut')
	opTwisted = not opTwisted
end