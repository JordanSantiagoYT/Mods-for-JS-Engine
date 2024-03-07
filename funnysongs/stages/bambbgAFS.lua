function onCreate()

	makeLuaSprite('theBg','sky',-680,-130)
	addLuaSprite('theBg',false)
	setLuaSpriteScrollFactor('theBg', 0.1, 0.1)

	makeLuaSprite('grasshill','gm_flatgrass', 450, 95)
	scaleObject('grasshill', 0.3, 0.3);
	addLuaSprite('grasshill',false)
	setLuaSpriteScrollFactor('grasshill', 0.3, 0.3)

	makeLuaSprite('hills','orangey hills', -380, 120)
	addLuaSprite('hills',false)
	setLuaSpriteScrollFactor('hills', 0.3, 0.3)

	makeLuaSprite('farm','funfarmhouse', -20, 160)
	addLuaSprite('farm',false)
	setLuaSpriteScrollFactor('farm', 0.6, 0.6)

	makeLuaSprite('ground','grass lands', -680, 550)
	addLuaSprite('ground',false)
	setLuaSpriteScrollFactor('ground', 1, 1)

	makeLuaSprite('corn1','CornFence', -440, 275)
	addLuaSprite('corn1',false)
	setLuaSpriteScrollFactor('corn1', 1, 1)

	makeLuaSprite('corn2','CornFence2', 1080, 275)
	addLuaSprite('corn2',false)
	setLuaSpriteScrollFactor('corn2', 1, 1)

	makeLuaSprite('thecornbag','cornbag', 1180, 605)
	addLuaSprite('thecornbag',false)
	setLuaSpriteScrollFactor('thecornbag', 1, 1)

	makeLuaSprite('sign','Sign', -40, 415)
	addLuaSprite('sign',false)		
	setLuaSpriteScrollFactor('sign', 1, 1)
end
function onStepHit()
	if curStep == 3072 then
		youAreDead();
	end
end
function onUpdate(elapsed)

  if curStep >= 3072 then

    songPos = getSongPosition()

    local currentBeat = (songPos/1780)*(bpm/60)

    doTweenY(dadTweenY, 'dad', 81-100*math.sin((currentBeat*0.25)*math.pi),0.001)

  end

end
function youAreDead()
        setProperty('defaultCamZoom',0.7)
	setProperty('sign.alpha', 0)
	setProperty('thecornbag.alpha', 0)
	setProperty('grasshill.alpha', 0)
	setProperty('fence.alpha', 0)
	setProperty('corn2.alpha', 0)
	setProperty('corn1.alpha', 0)
	setProperty('ground.alpha', 0)
	setProperty('farm.alpha', 0)
	setProperty('hills.alpha', 0)
	setProperty('theBg.alpha', 0)
	triggerEvent('Flash Camera', 0.6, 0)
end