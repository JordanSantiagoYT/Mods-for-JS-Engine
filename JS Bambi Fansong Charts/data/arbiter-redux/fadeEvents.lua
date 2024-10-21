function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaSprite('blackBG', '', 0, 0);
	makeGraphic('blackBG', 1280, 720, '000000')
	addLuaSprite('blackBG', true);
	setLuaSpriteScrollFactor('blackBG', 0, 0)
	setProperty('blackBG.scale.x', 2)
	setProperty('blackBG.scale.y', 2)
	setProperty('blackBG.alpha', 0)
	setObjectCamera('blackBG', 'camGame')
	setObjectOrder('blackBG', 7)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 16, 'linear')
end

function onStepHit()
	if curStep == 248 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fadeIn', 'flash', 1, 1.05, 'expoIn')
	end
	if curStep == 280 then
            noteTweenAlpha('byeNote1', 0, 0, 1, 'linear');
            noteTweenAlpha('byeNote2', 1, 0, 1, 'linear');
            noteTweenAlpha('byeNote3', 2, 0, 1, 'linear');
            noteTweenAlpha('byeNote4', 3, 0, 1, 'linear');
            noteTweenAlpha('myNotesAreGone1', 4, 0, 1, 'linear');
            noteTweenAlpha('myNotesAreGone2', 5, 0, 1, 'linear');
            noteTweenAlpha('myNotesAreGone3', 6, 0, 1, 'linear');
            noteTweenAlpha('myNotesAreGone4', 7, 0, 1, 'linear');
	end
	if curStep == 304 then
            noteTweenAlpha('noteBack1', 0, 1, 0.4, 'linear');
            noteTweenAlpha('noteBack2', 1, 1, 0.4, 'linear');
            noteTweenAlpha('noteBack3', 2, 1, 0.4, 'linear');
            noteTweenAlpha('noteBack4', 3, 1, 0.4, 'linear');
	end
	if curStep == 308 then
            noteTweenAlpha('noteBack5', 4, 1, 0.4, 'linear');
            noteTweenAlpha('noteBack6', 5, 1, 0.4, 'linear');
            noteTweenAlpha('noteBack3', 6, 1, 0.4, 'linear');
            noteTweenAlpha('noteBack4', 7, 1, 0.4, 'linear');
	end
	--credits to stinko for this part of the events lol
	if curStep == 311 then
		noteTweenY('dadStrumY', 0, -500, 0.8, 'quartIn')
		noteTweenY('dadStrumY1', 1, -500, 0.9, 'quartIn')
		noteTweenY('dadStrumY2', 2, -500, 1, 'quartIn')
		noteTweenY('dadStrumY3', 3, -500, 1.1, 'quartIn')
	end
	if curStep == 312 then
		noteTweenX('bfStrumX', 4, 415, 0.8, 'quartInOut')
		noteTweenX('bfStrumX1', 5, 525, 0.9, 'quartInOut')
		noteTweenX('bfStrumX2', 6, 635, 1, 'quartInOut')
		noteTweenX('bfStrumX3', 7, 745, 1.1, 'quartInOut')
	end
	if curStep == 320 then
		cameraFlash('camOther', 'ffffff', 0.7)
		addChromaticAbberationEffect ('camhud', 0.003)
		addChromaticAbberationEffect ('camgame', 0.003)
		addVCREffect('camgame')
		addVCREffect('camHUD')
		addGrayscaleEffect('camHUD');
		addGrayscaleEffect('camGame');
		setProperty('flash.alpha', 0)
		setProperty('blackBG.alpha', 1)
	end
	if curStep == 1536 then
		doTweenAlpha('fadeIn2', 'flash', 1, 2.05, 'expoIn')
	end
	if curStep == 1600 then
		doTweenAlpha('okBye', 'flash', 0, 0.4, 'linear')
	end
	if curStep == 1848 then
		setProperty('flash.alpha', 1)
	end
	if curBeat == 464 then --because this game likes being stupid with bpm changes, i have to use curBeat instead of curStep LOL
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 8448 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('okBye', 'flash', 1, 7.26, 'linear')
	end
	if curStep == 8512 then
		clearEffects('camHUD')
		clearEffects('camGame')
	end
end