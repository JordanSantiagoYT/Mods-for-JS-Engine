function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
	setProperty('JellyBG.visible', false)
	setProperty('dad.visible', false)
	setProperty('iconP2.visible', false)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 8, 'linear')
end

function onStepHit()
	if curStep == 496 or curStep == 2032 or curStep == 4592 then
		doTweenAlpha('fadeIn', 'flash', 1, 0.45, 'linear')
	end
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setProperty('dad.visible', true)
		setProperty('iconP2.visible', true)
	end
	if curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('JellyBG.visible', true)
	end
	if curStep == 2048 or curStep == 4608 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 4320 then
		doTweenAlpha('fadeIn', 'flash', 0.8, 5.4, 'linear')
	end
	if curStep == 4480 then
		doTweenAlpha('fadeIn', 'flash', 0, 2.8, 'linear')
	end
	if curStep == 5760 then
		doTweenAlpha('fadeIn', 'flash', 1, 12, 'linear')
	end
end