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
	doTweenAlpha('flTw', 'flash', 0, 13, 'linear')
end

function onStepHit()
	if curStep == 496 then
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 1)
	end
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setObjectCamera('flash', 'camOther')
	end
	if curStep == 4656 then
		doTweenAlpha('okBye', 'flash', 1, 11, 'linear')
	end
end