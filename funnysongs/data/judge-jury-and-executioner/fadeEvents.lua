function onCreate()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
end

function onSongStart()
	setPropertyFromGroup('opponentStrums',0,'alpha',0)
	setPropertyFromGroup('opponentStrums',1,'alpha',0)
	setPropertyFromGroup('opponentStrums',2,'alpha',0)
	setPropertyFromGroup('opponentStrums',3,'alpha',0)
	setPropertyFromGroup('playerStrums',0,'alpha',0)
	setPropertyFromGroup('playerStrums',1,'alpha',0)
	setPropertyFromGroup('playerStrums',2,'alpha',0)
	setPropertyFromGroup('playerStrums',3,'alpha',0)
	doTweenAlpha('flTw', 'flash', 0, 9, 'linear')
end
function onStepHit()
	if curStep <= 224 then
		setPropertyFromGroup('opponentStrums',0,'alpha',0)
		setPropertyFromGroup('opponentStrums',1,'alpha',0)
		setPropertyFromGroup('opponentStrums',2,'alpha',0)
		setPropertyFromGroup('opponentStrums',3,'alpha',0)
		setPropertyFromGroup('playerStrums',0,'alpha',0)
		setPropertyFromGroup('playerStrums',1,'alpha',0)
		setPropertyFromGroup('playerStrums',2,'alpha',0)
		setPropertyFromGroup('playerStrums',3,'alpha',0)
	end
	if curStep == 224 then
            noteTweenAlpha('helloNote1', 4, 1, 1.3, 'linear');
            noteTweenAlpha('helloNote2', 5, 1, 1.3, 'linear');
            noteTweenAlpha('helloNote3', 6, 1, 1.3, 'linear');
            noteTweenAlpha('helloNote4', 7, 1, 1.3, 'linear');
	end
	if curStep == 1020 or curStep == 2044 then
            noteTweenAlpha('GAH1', 0, 1, 0.3, 'linear');
            noteTweenAlpha('GAH2', 1, 1, 0.3, 'linear');
            noteTweenAlpha('GAH3', 2, 1, 0.3, 'linear');
            noteTweenAlpha('GAH4', 3, 1, 0.3, 'linear');
	end
	if curStep == 1536 then
   	     cameraFlash('camHUD', 'ffffff', 0.7)
		setPropertyFromGroup('opponentStrums',0,'alpha',0)
		setPropertyFromGroup('opponentStrums',1,'alpha',0)
		setPropertyFromGroup('opponentStrums',2,'alpha',0)
		setPropertyFromGroup('opponentStrums',3,'alpha',0)
	end
	if curStep == 2560 then
		setProperty('flash.alpha', 1)
	end
end
function hideNotes()
   	setProperty('iconP1.visible', false)
   	setProperty('iconP2.visible', false)
   	setProperty('strumLineNotes.visible', false)
   	setProperty('sustainNotes.visible', false)
   	setProperty('notes.visible', false)
    	setProperty('healthBar.visible', false)
   	setProperty('healthBarBG.visible', false)
   	setProperty('botplayTxt.visible', false)
   	setProperty('judgementCounter.visible', false)
end