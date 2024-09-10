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
	doTweenAlpha('flTw', 'flash', 0, 30, 'linear')
end

function onStepHit()
	if curStep == 1424 or curStep == 4384 then
		doTweenAlpha('fadingIn', 'flash', 0.9, 1.6, 'linear')
	end
	if curStep == 1472 or curStep == 4496 then
		doTweenAlpha('fadingOut', 'flash', 0, 1.6, 'linear')
	end
	if curStep == 2032 or curStep == 4080 or curStep == 5616 then
		doTweenAlpha('heheheehe', 'flash', 0.9, 0.5, 'linear')
	end
	if curStep == 2048 or curStep == 4096 or curStep == 5632 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 3580 then
		doTweenAlpha('more', 'flash', 0.9, 0.1, 'linear')
	end
	if curStep == 3584 then
		doTweenAlpha('slooowfadeOut', 'flash', 0, 15, 'linear')
	end
	if curStep == 5920 then
		doTweenAlpha('fadeOut', 'flash', 0, 9, 'linear')
	end
end