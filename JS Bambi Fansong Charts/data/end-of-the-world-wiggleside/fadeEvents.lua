function onCreatePost()
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
	doTweenAlpha('flTw', 'flash', 0, 17, 'linear')
end

function onStepHit()
	if curStep == 2544 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('flTw', 'flash', 1, 0.56, 'linear')
	end
	if curStep == 2560 then
		doTweenAlpha('flTw', 'flash', 0, 2, 'linear')
	end
	if curStep == 3576 then
		doTweenAlpha('flTw', 'flash', 1, 0.28, 'linear')
	end
	if curStep == 3584 then
		doTweenAlpha('flTw', 'flash', 0, 25, 'linear')
		cameraFlash('camOther', 'ffffff', 1)
		addVCREffect('camHUD')
		addVCREffect('camGame')
		addGrayscaleEffect('camHUD')
		addGrayscaleEffect('camGame')
	end
	if curStep == 4608 then
		cameraFlash('camOther', 'ffffff', 1)
        	clearEffects('camHUD')
       		clearEffects('camGame')
	end
	if curStep == 5600 then
		doTweenAlpha('flTw', 'flash', 1, 1.2, 'linear')
	end
	if curStep == 5636 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 7936 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('okBye', 'flash', 1, 9, 'linear')
	end
end