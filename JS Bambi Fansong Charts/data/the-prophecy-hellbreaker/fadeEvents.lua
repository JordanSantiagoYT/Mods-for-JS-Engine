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
	doTweenAlpha('flTw', 'flash', 0, 11, 'linear')
end

function onStepHit()
	if curStep == 768 then
		doTweenAlpha('fadeLol', 'flash', 1, 3.14, 'linear')
	end
	if curStep == 992 then
		doTweenAlpha('ToTheSong', 'flash', 0, 0.45, 'linear')
	end
	if curStep == 11520 then
		doTweenAlpha('okBye', 'flash', 1, 11.54, 'linear')
	end
end