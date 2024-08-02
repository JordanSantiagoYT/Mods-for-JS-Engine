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
	doTweenAlpha('flTw', 'flash', 0, 23, 'linear')
end

function onStepHit()
	if curStep == 1440 then
		doTweenAlpha('fadeIn', 'flash', 1, 1.3, 'linear')
	end
	if curStep == 1536 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 6116 then
		doTweenAlpha('fadeIn', 'flash', 0.8, 0.43, 'linear')
	end
	if curStep == 6144 then
		doTweenAlpha('fadeIn', 'flash', 0, 10, 'linear')
	end
	if curStep == 10272 then
		doTweenAlpha('okBye', 'flash', 1, 0.8, 'linear')
	end
end