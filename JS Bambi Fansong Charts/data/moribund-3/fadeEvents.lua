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
	doTweenAlpha('flTw', 'flash', 0, 15, 'linear')
end

function onStepHit()
	if curStep == 15360 or curStep == 24576 then
		setProperty('flash.alpha', 1)
	end
	if curStep == 15520 then
		doTweenAlpha('out1', 'flash', 0, 6.07, 'linear')
	end
	if curStep == 24592 then
		doTweenAlpha('out', 'flash', 0, 0.5, 'linear')
	end
	if curStep == 24608 then
		setObjectCamera('flash', 'camGame')
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 1)
	end
	if curStep == 24624 then
		doTweenAlpha('byeHUD', 'camHUD', 0.001, 1, 'linear')
	end
	if curStep == 24656 then
		setObjectCamera('flash', 'camOther')
		setProperty('flash.alpha', 1)
	end
end