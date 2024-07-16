function onCreate()
	setProperty('scoreTxt.visible', false)
    	setProperty('strumLineNotes.visible', false)
    	setProperty('sustainNotes.visible', false)
    	setProperty('iconP1.visible', false)
    	setProperty('iconP2.visible', false)
   	setProperty('notes.visible', false)
  	setProperty('timeBar.visible', false)
  	setProperty('timeBarBG.visible', false)
  	setProperty('timeTxt.visible', false)
  	setProperty('healthBar.visible', false)
  	setProperty('healthBarBG.visible', false)
	setProperty('botplayTxt.visible', false)

 	makeLuaSprite('whiteBG', '', 0, 0)
 	makeGraphic('whiteBG', screenWidth, screenHeight, 'FFFFFF')
 	setObjectOrder('whiteBG', 1)
  	addLuaSprite('whiteBG', true)
  	setLuaSpriteScrollFactor('whiteBG', 0, 0)
   	setProperty('whiteBG.scale.x', 2.5)
  	setProperty('whiteBG.scale.y', 2.5)
  	setProperty('whiteBG.alpha', 0)
  	setObjectCamera('whiteBG', 'camGame')
end

function onStepHit()
    if curStep == 512 then
	cameraFlash('camHUD', 'ffffff', 1)
	setProperty('scoreTxt.visible', true)
    	setProperty('strumLineNotes.visible', true)
    	setProperty('sustainNotes.visible', true)
    	setProperty('iconP1.visible', true)
    	setProperty('iconP2.visible', true)
   	setProperty('notes.visible', true)
  	setProperty('timeBar.visible', true)
  	setProperty('timeBarBG.visible', true)
  	setProperty('timeTxt.visible', true)
  	setProperty('healthBar.visible', true)
  	setProperty('healthBarBG.visible', true)
	setProperty('botplayTxt.visible', true)
    end
    if curStep == 1536 then
	cameraFlash('camOther', 'ffffff', 1)
        addChromaticAbberationEffect('camhud', 0.004)
        addChromaticAbberationEffect('camgame', 0.004)
        addBloomEffect('camhud', 0.3)
        addBloomEffect('camgame', 0.3)
    end
    if curStep == 2048 or curStep == 3104 or curStep == 4416 then
        clearEffects('camHUD')
        clearEffects('camGame')
    end
    if curStep == 2592 then
	cameraFlash('camOther', 'ffffff', 1)
	addVCREffect('camHUD')
	addVCREffect('camGame')
    end
    if curStep == 3104 then
        cameraFlash('camHUD', 'ffffff', 1)
    end
    if curStep == 3648 then
        cameraFlash('camHUD', 'ffffff', 1)
	setProperty('whiteBG.alpha', 1)
	setProperty('dad.color', '000000')
	setProperty('boyfriend.color', '000000')
        cameraFlash('camGame', 'ffffff', 1)
        doTweenAlpha('bg4FADEOUT', 'BG4', 0, 0.001, 'linear')
	doTweenAlpha('gifFADEOUT', 'GIF', 0, 0.001, 'linear')
	doTweenAlpha('edoFADEOUT', 'edolando', 0, 0.001, 'linear')
    end
    if curStep == 3904 then
	setProperty('whiteBG.alpha', 0)
        cameraFlash('camOther', 'ffffff', 1)
        setProperty('dad.color', getColorFromHex('ffffff'))
	setProperty('boyfriend.color', getColorFromHex('ffffff'))
        doTweenAlpha('bg4FADEIN', 'BG4', 0.38, 0.001, 'linear')
	doTweenAlpha('gifFADEIN', 'GIF', 1, 0.001, 'linear')
	doTweenAlpha('edoFADEIN', 'edolando', 1, 0.001, 'linear')
        cameraFlash('camHUD', 'ffffff', 1)
        addChromaticAbberationEffect('camhud', 0.006)
        addChromaticAbberationEffect('camgame', 0.006)
        addBloomEffect('camhud', 0.5)
        addBloomEffect('camgame', 0.5)
    end
    if curStep == 4928 then
        doTweenAlpha('hesDead', 'BG4', 0, 0.001, 'linear')
	doTweenAlpha('hesDead2', 'GIF', 0, 0.001, 'linear')
	doTweenAlpha('hesDead3', 'edolando', 0, 0.001, 'linear')
	setProperty('dad.visible', false)
	clearEffects('HUD')
        clearEffects('game')
	setProperty('camHUD.visible', false)
    end
end