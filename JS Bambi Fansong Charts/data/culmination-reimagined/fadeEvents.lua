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
	doTweenAlpha('flTw', 'flash', 0, 24, 'linear')
end

function onStepHit()
	if curStep == 3576 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('okBye', 'flash', 1, 0.4, 'linear')
	end
	if curStep == 3584 or curStep == 3585 or curStep == 3586 then
		doTweenAlpha('okBye', 'flash', 0, 12.8, 'linear')
	end
	if curStep == 5168 then
		doTweenAlpha('okBye', 'flash', 1, 1, 'linear')
	end
end