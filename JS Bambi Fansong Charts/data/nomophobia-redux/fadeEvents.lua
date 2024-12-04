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
	doTweenAlpha('flTw', 'flash', 0, 11, 'linear')
end

function onStepHit()
	if curStep == 768 or curStep == 1792 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 2774 then
		setProperty('flash.alpha', 1)
	end
end