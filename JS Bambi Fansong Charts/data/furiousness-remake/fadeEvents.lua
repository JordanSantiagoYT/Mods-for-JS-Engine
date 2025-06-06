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
	doTweenAlpha('flTw', 'flash', 0.5, 9, 'linear')
end

function onStepHit()
	if curStep == 128 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 1824 then
		doTweenAlpha('okBye', 'flash', 1, 20, 'linear')
	end
end