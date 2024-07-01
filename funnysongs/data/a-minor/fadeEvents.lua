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
	if curStep == 512 then
		doTweenAlpha('flTw', 'flash', 0, 14, 'linear')
	end
	if curStep == 5248 then
		doTweenAlpha('okBye', 'flash', 1, 13, 'linear')
	end
end