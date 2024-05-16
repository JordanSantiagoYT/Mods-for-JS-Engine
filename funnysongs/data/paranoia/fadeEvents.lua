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
	doTweenAlpha('flTw', 'flash', 0, 8, 'linear')
end

local fadedOutYet = false
function onStepHit()
	if curStep >= 4912 and not fadedOutYet then
		fadedOutYet = true
		doTweenAlpha('flashIn', 'flash', 1, 10, 'linear')
	end
end