function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 0)
	setObjectCamera('flash', 'camGame')

	makeLuaSprite('sunset','sky_sunset',-680,-130)
	addLuaSprite('sunset',false)
	setLuaSpriteScrollFactor('sunset', 0.1, 0.1)
	setProperty('sunset.alpha', 0)
	setObjectOrder('sunset', 1)

	doTweenAlpha('bg', 'theBg', '0', 0.01, 'linear')
	doTweenAlpha('bg1', 'sunset', '1', 0.01, 'linear')
	tweenColors('0xffff8fb2')
end

function onStepHit()
	if curStep == 256 or curStep == 384 or curStep == 640 or curStep == 1024 or curStep == 1536 or curStep == 2048 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
	end
	if curStep == 910 or curStep == 2048 then
		doTweenAlpha('overlayIn', 'flash', 0.3, 0.7, 'linear')
	end
	if curStep == 1016 or curStep == 2048 then
		doTweenColor('dadCol', 'dad', '0xffff8fb2', 0.01, 'quadInOut')
	end
	if curStep == 1020 then
		doTweenAlpha('overlayOut', 'flash', 0, 0.7, 'linear')
	end
	if curStep == 2064 then
		doTweenAlpha('fadeOut', 'flash', 1, 14, 'linear')
	end
end

function tweenColors(color)
	doTweenColor('MoldyGH', 'grasshill', color, 0.01, 'linear')
	doTweenColor('h', 'hills', color, 0.01, 'linear')
	doTweenColor('f', 'farm', color, 0.01, 'linear')
	doTweenColor('grpun', 'ground', color, 0.01, 'linear')
	doTweenColor('c1', 'corn1', color, 0.01, 'linear')
	doTweenColor('c2', 'corn2', color, 0.01, 'linear')
	doTweenColor('cb', 'thecornbag', color, 0.01, 'linear')
	doTweenColor('ctsign', 'sign', color, 0.01, 'linear')
   	doTweenColor('boyfriendColorTween', 'boyfriend', color, 0.01, 'linear')
    	doTweenColor('dadColorTween', 'dad', color, 0.01, 'linear')
    	doTweenColor('gfColorTween', 'gf',color, 0.01, 'linear')
end