function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
	setProperty('dad.alpha', 0)
	setProperty('iconP2.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 1, 'linear')
end

function onStepHit()
	if curStep == 48 then
		doTweenAlpha('shortFade', 'flash', 1, 0.45, 'linear')
	end
	if curStep == 64 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setProperty('dad.alpha', 1)
		setProperty('iconP2.alpha', 1)
	end
	if curStep == 576 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 1056 then
		doTweenAlpha('blackOut', 'flash', 0.97, 0.94, 'linear')
	end
	if curStep == 1088 then
		doTweenAlpha('fadeOutAgain', 'flash', 0, 4, 'linear')
	end
	if curStep == 3136 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
	end
end