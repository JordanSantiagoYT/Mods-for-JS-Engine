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
	doTweenAlpha('flTw', 'flash', 0, 28, 'linear')
end

function onStepHit()
	if curStep == 1984 or curStep == 15296 then
		doTweenAlpha('fadeIn', 'flash', 1, 0.92, 'linear')
	end
	if curStep == 2016 or curStep == 15328 then
		doTweenAlpha('fadeOut', 'flash', 0, 0.92, 'linear')
	end
	if curStep == 5056 then
		doTweenAlpha('fadeIn', 'flash', 0.975, 1.84, 'linear')
	end
	if curStep == 5120 then
		doTweenAlpha('fadeIn', 'flash', 0, 28.3, 'linear')
	end
	if curStep == 9216 then
		addBlockedGlitchEffect('camHUD')
		addBlockedGlitchEffect('camGame')
	end
	if curStep == 13312 then
		clearEffects('camHUD')
		clearEffects('camGame')
	end
end