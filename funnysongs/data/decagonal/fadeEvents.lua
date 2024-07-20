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
	doTweenAlpha('flTw', 'flash', 0.8, 8, 'linear')
end

function onStepHit()
	if curStep == 58 then
		doTweenAlpha('flTw', 'flash', 0.6, 0.001, 'linear')
	end
	if curStep >= 60 and curStep < 64 then
		setProperty('flash.alpha', getProperty('flash.alpha') - 0.15)
	end
	if curStep == 768 then
		doTweenAlpha('okBye', 'flash', 1, 9, 'linear')
	end
end