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
	doTweenAlpha('flTw', 'flash', 0.7, 12.92, 'linear')
end

function onStepHit()
	if curStep == 448 then
		doTweenAlpha('fadeOut', 'flash', 0, 1.84, 'linear')
	end
	if curStep == 512 or curStep == 1536 or curStep == 3584 or curStep == 14846 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 3520 then
		doTweenAlpha('fadeOut', 'flash', 0.88, 0.9, 'linear')
	end
	if curStep == 3552 then
		doTweenAlpha('fadeOut', 'flash', 0, 0.9, 'linear')
	end
	if curStep == 3584 then
		addBlockedGlitchEffect('camHUD')
		addBlockedGlitchEffect('camGame')
	end
	if curStep == 5632 then
		clearEffects('camHUD')
		clearEffects('camGame')
	end
	if curStep == 12928 then
		doTweenAlpha('fakeFadeOut', 'flash', 1, 25.84, 'linear')
	end
	if curStep == 14320 then
		doTweenAlpha('TRICKED', 'flash', 0, 0.46, 'linear')
	end
end