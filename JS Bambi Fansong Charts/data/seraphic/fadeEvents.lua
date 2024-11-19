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
	doTweenAlpha('flTw', 'flash', 0, 14, 'linear')
end

function onStepHit()
	if curStep == 768 then
		doTweenAlpha('byeDad', 'dad', 0, 1.2, 'linear')
	end
	if curStep == 784 then
		doTweenAlpha('wbDad', 'dad', 1, 1.2, 'linear')
	end
	if curStep == 800 then
		doTweenAlpha('byeBF', 'boyfriend', 0, 1.2, 'linear')
	end
	if curStep == 816 then
		doTweenAlpha('wbBF', 'boyfriend', 1, 1.2, 'linear')
	end
	if curStep == 7616 then
		doTweenAlpha('okBye', 'flash', 1, 6.16, 'linear')
	end
end