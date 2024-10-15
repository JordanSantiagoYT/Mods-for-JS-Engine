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
	if curStep == 224 or curStep == 736 or curStep == 2784 then
		doTweenAlpha('fadeIn', 'flash', 0.8, 0.6, 'linear')
	end
	if curStep == 244 or curStep == 756 or curStep == 2804 then
		doTweenAlpha('fadeOut', 'flash', 0, 0.52, 'expoIn')
	end
	if curStep == 3968 then
		doTweenAlpha('okBye', 'flash', 1, 5.66, 'linear')
	end
end