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
	doTweenAlpha('flTw', 'flash', 0, 15, 'linear')
end

function onStepHit()
	if curStep == 480 then
		addBlockedGlitchEffect('camHUD')
		addBlockedGlitchEffect('camGame')
	end
	if curStep == 544 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 1)
		clearEffects('camHUD')
		clearEffects('camGame')
	end
	if curStep == 576 then
		doTweenAlpha('fadeOut', 'flash', 0, 3, 'linear')
	end
	if curStep == 604 then
		setProperty('flash.alpha', 1)
	end
	if curStep == 608 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 800 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 1)
	end
	if curStep == 824 then
		doTweenAlpha('fadeOut', 'flash', 0, 3, 'linear')
	end
	if curStep == 1088 then
		doTweenAlpha('okBye', 'flash', 1, 6, 'linear')
	end
end