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
	doTweenAlpha('flTw', 'flash', 0, 10, 'linear')
end

function onStepHit()
	if curStep == 112 then
		doTweenAlpha('nvm', 'flash', 1, 10, 'linear')
	end
	if curStep == 288 then
		doTweenAlpha('nvmAgain', 'flash', 0, 10, 'linear')
	end
	if curStep == 4864 then
		doTweenAlpha('nvm', 'flash', 1, 28, 'linear')
	end
end