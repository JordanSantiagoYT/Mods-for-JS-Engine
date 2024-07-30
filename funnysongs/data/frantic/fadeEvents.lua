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

function onStepHit()
	if curStep == 12 then
		doTweenAlpha('fadeOut', 'flash', 0, 10, 'linear')
	end
	if curStep == 108 then
		doTweenAlpha('lolBye', 'flash', 1, 2, 'linear')
	end
	if curStep == 126 then
		doTweenAlpha('trickedYa', 'flash', 0, 1.4, 'linear')
	end
	if curStep == 664 or curStep == 792 then
		doTweenAlpha('broWhereAreYouGoing', 'dad', 0, 2.3, 'linear')
	end
	if curStep == 688 or curStep == 816 then
		doTweenAlpha('ohNVMHeBack', 'dad', 1, 2.3, 'linear')
	end
	if curStep == 1552 then
		setProperty('flash.alpha', 0.7)
		doTweenAlpha('goodBYE', 'flash', 1, 6.37, 'linear')
	end
end