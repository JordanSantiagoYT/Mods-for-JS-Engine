function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 0)
	setObjectCamera('flash', 'camOther')
end

function onStepHit()
	if curStep == 512 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fadeIn', 'flash', 1, 1.4, 'linear')
	end
	if curStep == 544 then
		cameraFlash('camOther', 'ffffff', 1)
		setObjectCamera('flash', 'camOther')
		setProperty('flash.alpha', 0)
	end
	if curStep == 2096 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 1)
	end
end