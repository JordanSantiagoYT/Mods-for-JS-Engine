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
	doTweenAlpha('flTw', 'flash', 0, 20, 'linear')
end

function onStepHit()
	if curStep == 252 or curStep == 1016 then
		doTweenAlpha('fadeIn', 'flash', 1, 0.3, 'linear')
	end
	if curStep == 256 or curStep == 512 or curStep == 640 or curStep == 768 or curStep == 912 or curStep == 1024 or curStep == 1152 or curStep == 1280 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 496 or curStep == 1136 or curStep == 1264 then
		doTweenAlpha('fadeIn', 'flash', 1, 1.3, 'linear')
	end
	if curStep == 632 or curStep == 760 or curStep == 896 then
		doTweenAlpha('fadeIn', 'flash', 1, 0.6, 'linear')
	end
	if curStep == 904 then
		doTweenAlpha('fadeIn', 'flash', 0, 0.6, 'linear')
	end
	if curStep == 1020 then
		doTweenAlpha('bye', 'flash', 0, 0.3, 'linear')
	end
	if curStep == 1344 then
		doTweenAlpha('bye', 'flash', 1, 9.4, 'linear')
	end
end