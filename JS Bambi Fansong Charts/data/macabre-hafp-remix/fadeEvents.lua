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

function onStepHit()
	if curStep == 112 then
		doTweenAlpha('fadeIn1', 'flash', 0, 0.48, 'linear')
	end
	if curStep == 128 or curStep == 5264 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 5248 then
		doTweenAlpha('aaaa', 'flash', 0.8, 0.24, 'linear')
	end
	if curStep == 5256 then
		doTweenAlpha('lol', 'flash', 0, 0.24, 'linear')
	end
	if curStep == 5280 then
		doTweenAlpha('bye!!', 'flash', 1, 2.9, 'linear')
	end
end