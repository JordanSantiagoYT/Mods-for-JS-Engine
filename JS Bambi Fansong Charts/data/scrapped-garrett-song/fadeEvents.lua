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
	cameraFlash('camOther', 'ffffff', 1)
	doTweenAlpha('flTw', 'flash', 0, 0.001, 'linear')
end

function onStepHit()
	if curStep == 1488 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fadeIn', 'flash', 1, 1.12, 'linear')
	end
	if curStep == 1568 then
		cameraFlash('camOther', 'ffffff', 1)
		setObjectCamera('flash', 'camOther')
		setProperty('flash.alpha', 0)
	end
	if curStep == 1952 then
		cameraFlash('camOther', 'ffffff', 1)
		doTweenAlpha('okBye', 'flash', 1, 0.6, 'linear')
	end
end