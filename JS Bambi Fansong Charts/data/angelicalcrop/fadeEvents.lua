function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 0.9)
	setObjectCamera('flash', 'camOther')
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 20, 'linear')
end

function onStepHit()
	if curStep == 2944 or curStep == 4992 then
		doTweenAlpha('in', 'flash', 0.9, 3.7, 'linear')
	end
	if curStep == 3072 or curStep == 5120 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 5440 then
		doTweenAlpha('okBye', 'flash', 1, 30, 'linear')
	end
end