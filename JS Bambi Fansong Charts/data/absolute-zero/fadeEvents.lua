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
	doTweenAlpha('flTw', 'flash', 0, 21, 'linear')
end

function onStepHit()
	if curStep == 1520 or curStep == 1528 or curStep == 3064 then
		doTweenAlpha('fadeIn', 'flash', 0.95, 0.32, 'linear')
	end
	if curStep == 1528 then
		setProperty('flash.alpha', 0.5)
	end
	if curBeat == 384 or curBeat == 512 or curBeat == 768 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 2032 then
		doTweenAlpha('fadeIn', 'flash', 0.95, 0.67, 'linear')
	end
	if curStep == 4352 then
		doTweenAlpha('fadeIn', 'flash', 1, 10.8, 'linear')
	end
end