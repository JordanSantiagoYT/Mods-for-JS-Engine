function onCreate()

	makeLuaSprite('theBg','rewindBG/Space',-680,-130)
	addLuaSprite('theBg',false)
	setLuaSpriteScrollFactor('theBg', 0.1, 0.1)

	makeLuaSprite('grasshill','rewindBG/bw gm_flatgrass', 450, 95)
	scaleObject('grasshill', 0.3, 0.3);
	addLuaSprite('grasshill',false)
	setLuaSpriteScrollFactor('grasshill', 0.3, 0.3)

	makeLuaSprite('hills','rewindBG/bw orangey hills', -380, 120)
	addLuaSprite('hills',false)
	setLuaSpriteScrollFactor('hills', 0.3, 0.3)

	makeLuaSprite('farm','rewindBG/bw funfarmhouse', -20, 160)
	addLuaSprite('farm',false)
	setLuaSpriteScrollFactor('farm', 0.6, 0.6)

	makeLuaSprite('ground','rewindBG/bw grass lands', -680, 550)
	addLuaSprite('ground',false)
	setLuaSpriteScrollFactor('ground', 1, 1)

	makeLuaSprite('corn1','rewindBG/bw CornFence', -440, 275)
	addLuaSprite('corn1',false)
	setLuaSpriteScrollFactor('corn1', 1, 1)

	makeLuaSprite('corn2','rewindBG/bw CornFence2', 1080, 275)
	addLuaSprite('corn2',false)
	setLuaSpriteScrollFactor('corn2', 1, 1)

	makeLuaSprite('thecornbag','rewindBG/bw cornbag', 1180, 605)
	addLuaSprite('thecornbag',false)
	setLuaSpriteScrollFactor('thecornbag', 1, 1)

	makeLuaSprite('sign','rewindBG/bw Sign', -40, 415)
	addLuaSprite('sign',false)		
	setLuaSpriteScrollFactor('sign', 1, 1)
end

local shadname = "FLAG"

function onCreatePost()
	initLuaShader("FLAG")
	setSpriteShader('theBg', shadname)
end
	
function onUpdate(elapsed)
	setShaderFloat('theBg', 'uWaveAmplitude', 0.1)
	setShaderFloat('theBg', 'uFrequency', 5)
	setShaderFloat('theBg', 'uSpeed', 2.25)
end

function onUpdatePost(elapsed)
	setShaderFloat('theBg', 'uTime', os.clock())
end
