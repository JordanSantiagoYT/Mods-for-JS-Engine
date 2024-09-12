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
	cameraFlash('camOther', 'ffffff', 1)
	setProperty('flash.alpha', 0)
end

function onStepHit()
	if curStep == 504 then
		doTweenAlpha('fadeIn', 'flash', 0.96, 0.58, 'linear')
	end
	if curStep == 1008 or curStep == 1520 or curStep == 2032 then
		doTweenAlpha('fadeIn', 'flash', 0.96, 1.18, 'linear')
	end
	if curStep == 512 or curStep == 1024 or curStep == 1536 or curStep == 1792 or curStep == 2048 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 2432 then
		doTweenAlpha('okBye', 'flash', 1, 9.6, 'linear')
	end
end