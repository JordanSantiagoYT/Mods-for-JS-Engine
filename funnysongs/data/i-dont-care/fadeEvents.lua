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

function onStepHit()
	if curStep == 7680 then
		doTweenAlpha('okBye', 'flash', 1, 10.4, 'linear')
	end
	if curStep == 8176 then
		doTweenAlpha('trickedyaLMAO', 'flash', 0, 0.3, 'linear')
	end
	if curStep == 8224 then
		doTweenAlpha('REALBye', 'flash', 1, 8, 'linear')
	end
end