function onCreate()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
    	setProperty('iconP1.visible', false)
    	setProperty('iconP2.visible', false)
    	setProperty('timeBar.visible', false)
    	setProperty('timeBarBG.visible', false)
    	setProperty('timeTxt.visible', false)
    	setProperty('healthBar.visible', false)
    	setProperty('healthBarBG.visible', false)
    	setProperty('scoreTxt.visible', false)
end

function onSongStart()
	setPropertyFromGroup('opponentStrums',0,'alpha',0)
	setPropertyFromGroup('opponentStrums',1,'alpha',0)
	setPropertyFromGroup('opponentStrums',2,'alpha',0)
	setPropertyFromGroup('opponentStrums',3,'alpha',0)
	setProperty('flash.alpha', 0)
end
function onStepHit()
	if curStep == 264 then
	    doTweenAlpha('bfNOOO', 'boyfriend', 0, 1, 'linear')
            noteTweenAlpha('jumpscare1', 0, 1, 1, 'linear');
            noteTweenAlpha('jumpscare2', 1, 1, 1, 'linear');
            noteTweenAlpha('jumpscare3', 2, 1, 1, 'linear');
            noteTweenAlpha('jumpscare4', 3, 1, 1, 'linear');
            noteTweenAlpha('myNotesAreGone1', 4, 0, 1, 'linear');
            noteTweenAlpha('myNotesAreGone2', 5, 0, 1, 'linear');
            noteTweenAlpha('myNotesAreGone3', 6, 0, 1, 'linear');
            noteTweenAlpha('myNotesAreGone4', 7, 0, 1, 'linear');
	end
	if curStep == 336 then
   	     cameraFlash('camOther', 'ffffff', 0.7)
	    setProperty('boyfriend.alpha', 0)
            noteTweenAlpha('jumpscare5', 0, 0, 1, 'linear');
            noteTweenAlpha('jumpscare6', 1, 0, 1, 'linear');
            noteTweenAlpha('jumpscare7', 2, 0, 1, 'linear');
            noteTweenAlpha('jumpscare8', 3, 0, 1, 'linear');
            noteTweenAlpha('myNotesAreBack1', 4, 0, 1, 'linear');
            noteTweenAlpha('myNotesAreBack2', 5, 0, 1, 'linear');
            noteTweenAlpha('myNotesAreBack3', 6, 0, 1, 'linear');
            noteTweenAlpha('myNotesAreBack4', 7, 0, 1, 'linear');
	    hideNotes()
	end
	if curStep == 392 then
   		setProperty('strumLineNotes.visible', true)
   		setProperty('sustainNotes.visible', true)
   		setProperty('notes.visible', true)
	    setProperty('boyfriend.alpha', 0)
            noteTweenAlpha('jumpscareBack', 0, 1, 1, 'linear');
            noteTweenAlpha('jumpscareBack2', 1, 1, 1, 'linear');
            noteTweenAlpha('jumpscareBack3', 2, 1, 1, 'linear');
            noteTweenAlpha('jumpscareBack4', 3, 1, 1, 'linear');
	end
	if curStep == 464 then
   	    cameraFlash('camOther', 'ffffff', 1)
	    setProperty('boyfriend.alpha', 1)
            noteTweenAlpha('myNotesAreBack9', 4, 1, 0.0001, 'linear');
            noteTweenAlpha('myNotesAreBack10', 5, 1, 0.0001, 'linear');
            noteTweenAlpha('myNotesAreBack11', 6, 1, 0.0001, 'linear');
            noteTweenAlpha('myNotesAreBack12', 7, 1, 0.0001, 'linear');
   	    setProperty('judgementCounter.visible', true)
	end
	if curStep == 840 then
	    doTweenAlpha('bfNOOOWAAA', 'boyfriend', 0, 1, 'linear')
            noteTweenAlpha('jumpscareBOO1', 0, 0, 1, 'linear');
            noteTweenAlpha('jumpscareBOO2', 1, 0, 1, 'linear');
            noteTweenAlpha('jumpscareBOO3', 2, 0, 1, 'linear');
            noteTweenAlpha('jumpscareBOO4', 3, 0, 1, 'linear');
            noteTweenAlpha('byenote1', 4, 0, 1, 'linear');
            noteTweenAlpha('byenote2', 5, 0, 1, 'linear');
            noteTweenAlpha('byenote3', 6, 0, 1, 'linear');
            noteTweenAlpha('byenote4', 7, 0, 1, 'linear');
	end
	if curStep == 848 then
   	    setProperty('judgementCounter.visible', false)
	end
	if curStep == 1008 then
   	    setProperty('judgementCounter.visible', true)
   	    cameraFlash('camOther', 'ffffff', 1)
	    setProperty('boyfriend.alpha', 1)
            noteTweenAlpha('jumpscareBOO', 0, 1, 1, 'linear');
            noteTweenAlpha('jumpscareBOOAA', 1, 1, 1, 'linear');
            noteTweenAlpha('jumpscareBOOAAA', 2, 1, 1, 'linear');
            noteTweenAlpha('jumpscareBOOAAAA', 3, 1, 1, 'linear');
            noteTweenAlpha('nvmtheyreback1', 4, 1, 1, 'linear');
            noteTweenAlpha('nvmtheyreback2', 5, 1, 1, 'linear');
            noteTweenAlpha('nvmtheyreback3', 6, 1, 1, 'linear');
            noteTweenAlpha('nvmtheyreback4', 7, 1, 1, 'linear');
	end
	if curStep == 1392 then
   	    cameraFlash('camOther', 'ffffff', 1)
	    hideNotes()
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