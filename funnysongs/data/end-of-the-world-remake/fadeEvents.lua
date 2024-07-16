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
	doTweenAlpha('flTw', 'flash', 0, 18, 'linear')
end

function onStepHit()
	if curStep == 2556 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fadeIn', 'flash', 1, 0.2, 'linear')
	end
	if curStep == 2592 then
		doTweenAlpha('fadeIn', 'flash', 0.5, 1, 'linear')
	end
	if curStep == 3104 then
		doTweenAlpha('fadeIn', 'flash', 0, 0.4, 'linear')
	end
	if curStep == 4672 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('byebye!', 'flash', 0.8, 12, 'linear')
	end
	if curStep == 4912 then
		doTweenAlpha('trollLol', 'flash', 0, 0.4, 'linear')
	end
	if curStep == 4992 then
		doTweenAlpha('BYEEE', 'flash', 1, 4, 'linear')
	end
end