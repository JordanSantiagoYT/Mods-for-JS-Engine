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
	doTweenAlpha('flTw', 'flash', 0, 1.7, 'linear')
end

function onStepHit()
	if curStep == 64 or curStep == 1088 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 1056 then
		doTweenAlpha('flTw', 'flash', 0.9, 0.9, 'linear')
	end
	if curStep == 3136 then
		doTweenAlpha('nvm', 'flash', 1, 1.9, 'linear')
	end
end