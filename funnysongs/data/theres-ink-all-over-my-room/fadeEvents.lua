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
	doTweenAlpha('flTw', 'flash', 0, 30, 'linear')
end

fadeTweenedYet = false

function onStepHit()
	if curStep >= 37888 and not fadeTweenedYet then
		fadeTweenedYet = true
		doTweenAlpha('okBye', 'flash', 1, 15, 'linear')
	end
end