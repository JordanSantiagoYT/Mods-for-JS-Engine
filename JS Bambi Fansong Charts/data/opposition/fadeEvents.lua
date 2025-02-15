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
	doTweenAlpha('flTw', 'flash', 0, 15, 'linear')
end

function onStepHit()
	if curStep == 832 and not difficultyName == 'Spammier' then
		doTweenAlpha('okBye', 'flash', 1, 14, 'linear')
	end
	if curStep == 3328 and difficultyName == 'Spammier' then
		doTweenAlpha('okBye', 'flash', 1, 14, 'linear')
	end
end