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
	doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 24.7, 'linear')
end

function onStepHit()
	if curStep == 1152 then
		doTweenAlpha('okBye', 'flash', 1, 14.1, 'linear')
	end
end