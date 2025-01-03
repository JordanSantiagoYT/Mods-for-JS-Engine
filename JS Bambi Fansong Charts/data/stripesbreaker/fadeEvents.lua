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
	if curStep == 7424 then
		doTweenAlpha('okBye', 'flash', 1, 10.9, 'linear')
	end
end