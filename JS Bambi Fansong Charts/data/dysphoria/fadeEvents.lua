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
	doTweenAlpha('flTw', 'flash', 0, 12.8, 'linear')
end

function onStepHit()
	if curStep == 120 then
		doTweenAlpha('lol', 'flash', 1, 0.4, 'linear')
	end
	if curStep == 128 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 1)
	end
	if curStep == 1728 then
		doTweenAlpha('okBye', 'flash', 1, 20, 'linear')
	end
end