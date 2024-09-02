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
	if curStep == 32 then
		doTweenAlpha('fadeOut', 'flash', 0, 2.6, 'linear')
	end
	if curStep == 64 or curStep == 592 then
		cameraFlash('camOther', 'ffffff', 1)
	end
	if curStep == 2160 then
		doTweenAlpha('okBye', 'flash', 1, 5, 'linear')
	end
end