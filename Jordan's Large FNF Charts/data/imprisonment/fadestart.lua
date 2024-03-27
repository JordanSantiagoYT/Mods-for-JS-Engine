function onCreate()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 0)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
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
    	setProperty('scoreTxt.visible', false)
end

didFadeTween = false
didBlackOutTween = false
didFadeTweenOutAgain = false
didAnotherBlackout = false

function onUpdatePost()
	songPosition = getSongPosition()
	if songPosition >= 24770 and not didFadeTween then 
		didFadeTween = true
		doTweenAlpha('flTw', 'flash', 0, 9, 'linear')
	end
	if songPosition >= 99096 and didFadeTween and not didBlackOutTween then 
		didBlackOutTween = true
		doTweenAlpha('flash2', 'flash', 1, 0.00001, 'linear')
		hideNotes()
	end
	if songPosition >= 107350 and didFadeTween and not didFadeTweenOutAgain then 
		didFadeTweenOutAgain = true
		doTweenAlpha('flash2', 'flash', 0, 9, 'linear')
	end
	if songPosition >= 165160 and didFadeTween and not didAnotherBlackout then 
		didAnotherBlackout = true
		doTweenAlpha('flash2', 'flash', 1, 0.00001, 'linear')
		hideNotes()
	end
end
function onStepHit()
	if curStep == 1024 or curStep == 3584 then
   	     cameraFlash('camOther', 'ffffff', 0.7)
   	     setProperty('iconP1.visible', true)
   	     setProperty('iconP2.visible', true)
   	     setProperty('strumLineNotes.visible', true)
   	     setProperty('sustainNotes.visible', true)
   	     setProperty('notes.visible', true)
   	     setProperty('timeTxt.visible', true)
   	     setProperty('timeBar.visible', true)
   	     setProperty('timeBarBG.visible', true)
    	     setProperty('healthBar.visible', true)
   	     setProperty('healthBarBG.visible', true)
   	     setProperty('scoreTxt.visible', true)
	end
end
function hideNotes()
   	setProperty('iconP1.visible', false)
   	setProperty('iconP2.visible', false)
   	setProperty('strumLineNotes.visible', false)
   	setProperty('sustainNotes.visible', false)
   	setProperty('notes.visible', false)
   	setProperty('timeTxt.visible', false)
   	setProperty('timeBar.visible', false)
   	setProperty('timeBarBG.visible', false)
    	setProperty('healthBar.visible', false)
   	setProperty('healthBarBG.visible', false)
end