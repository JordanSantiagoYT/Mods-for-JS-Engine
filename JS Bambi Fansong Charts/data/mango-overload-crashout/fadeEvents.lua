function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "MANGO OVERLOAD CRASHOUT\n\nMango by violet\n\nChart by Jordan Santiago\n\nthose who know:", 1250, 0, 720)
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
	initLuaShader("chromSplit")
	initLuaShader("gray")
	addShadersOnCamera("camHUD",  {"gray", "chromSplit"})
	addShadersOnCamera("camGame", {"gray", "chromSplit"})
end

function onSongStart()
	setProperty('camZoomingDecay', 4)
end

mangoMode = false
mangoDrop = {0, 4, 8, 11, 14}
function onStepHit()
	if curStep == 64 then
		doTweenAlpha('flTw', 'flash', 0, 2, 'linear')
	end
	if curStep == 112 then
		doTweenAlpha('flTw', 'flash', 1, (200/curBpm), 'linear')
	end
	if curStep == 128 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 160 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 480 then
		doTweenShaderValue('mangrey', 'gray', 'grayIntensity', 1, 1.1, 'expoOut')
	end
	if curStep == 496 then
		doTweenShaderValue('mangrey2', 'gray', 'grayIntensity', 0, 1.11, 'expoIn')
	end
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		mangoMode = true
	end
	if curStep == 640 then
		cameraFlash('camOther', 'ffffff', 0.7)
		mangoMode = false
		removeMangos()
		setShaderValue('gray', 'grayIntensity', 1)
	end
	if curStep == 896 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setShaderValue('gray', 'grayIntensity', 0)
	end
	if curStep >= 1280 and curStep < 1400 and curStep % 4 == 0 and getProperty('camBopIntensity') > 0 then
		setProperty('camBopIntensity', getProperty('camBopIntensity') - 0.0625) 
	end
	if curStep == 4736 then
		doTweenAlpha('flTw', 'flash', 1, 11, 'linear')
	end
	if mangoMode then
		for i = 0, #mangoDrop do
			if curStep % 16 == mangoDrop[i] then
				if curStep % 16 ~= 0 and curStep % 16 ~= 8 then triggerEvent('Add Camera Zoom', 0.06, 0.12) end
				if shadersEnabled then
					setShaderValue('chromSplit', 'aberration', 0.04)
           			doTweenShaderValue("chromOut", "chromSplit", "aberration", 0, 60 / curBpm, 'quadOut')
				end
				break
			end
		end
	end
end

local mangos = {}
local spawnTimer = 0
function onUpdate(elapsed)
    if mangoMode then
        spawnTimer = spawnTimer + elapsed
        if spawnTimer >= 0.1 then
            spawnMango()
            spawnTimer = 0
        end
		for i = #mangos, 1, -1 do
			local mangoName = mangos[i]
			if getProperty(mangoName..'.y') > screenHeight then
				removeLuaSprite(mangoName, true)
				table.remove(mangos, i)
			end
		end
    end
end

mangoCount = 0
function spawnMango()
	mangoCount = mangoCount + 1;
    local mangoName = 'mango_' .. mangoCount
    makeLuaSprite(mangoName, 'mango', getRandomInt(0, screenWidth - 64), -64)
	scaleObject(mangoName, 0.2, 0.2)
    setObjectCamera(mangoName, 'camOther')
    addLuaSprite(mangoName)

    setProperty(mangoName..'.velocity.y', getRandomInt(400, 800))

    table.insert(mangos, mangoName)
end

function removeMangos()
	for i = #mangos, 1, -1 do
        local mangoName = mangos[i]
        removeLuaSprite(mangoName, true)
        table.remove(mangos, i)
    end
end