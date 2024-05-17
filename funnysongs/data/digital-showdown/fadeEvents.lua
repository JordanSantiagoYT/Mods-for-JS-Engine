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
	doTweenAlpha('flTw', 'flash', 0, 8, 'linear')
end
function onStepHit()
	if curStep == 304 then
		doTweenAlpha('flashIn1', 'flash', 1, 2, 'linear')
	end
	if curStep == 320 then
		doTweenAlpha('flashOut1', 'flash', 0, 8, 'linear')
	end
	if curStep == 1424 then
		doTweenAlpha('flashIn2', 'flash', 1, 3, 'linear')
	end
	if curStep == 1472 then
		doTweenAlpha('flashInstantlyOut1', 'flash', 0, 0.001, 'linear')
		cameraFlash('camHUD', 'ffffff', 1)
	end
	if curStep == 2720 then
		doTweenAlpha('flashIn3', 'flash', 1, 1, 'linear')
	end
	if curStep == 2752 then
		doTweenAlpha('flashInstantlyOut2', 'flash', 0, 0.001, 'linear')
		cameraFlash('camHUD', 'ffffff', 1)
	end
	if curStep == 3584 then
		doTweenAlpha('flashIn4', 'flash', 1, 4.6, 'linear')
	end
	if curStep == 3648 then
		doTweenAlpha('flashOutPartially', 'flash', 0.5, 15, 'linear')
	end
	if curStep == 3840 then
		setProperty('flash.alpha', 0)
		cameraFlash('camHUD', 'ffffff', 1)
	end
	if curStep == 6032 then
		doTweenAlpha('finalFlashIn', 'flash', 1, 8, 'linear')
	end
end