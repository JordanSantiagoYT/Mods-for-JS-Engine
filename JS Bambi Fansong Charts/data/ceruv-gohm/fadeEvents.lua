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
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 12, 'linear')
end

function onStepHit()
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('dad.alpha', 1)
	end
	if curStep == 2816 then
		doTweenAlpha('okBye', 'flash', 1, 2, 'linear')
	end
end