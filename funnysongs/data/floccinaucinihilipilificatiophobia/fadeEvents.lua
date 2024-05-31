function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
	makeLuaSprite('flashBG', '', 0, 0);
	makeGraphic('flashBG', 1280, 720, '000000')
	addLuaSprite('flashBG', true);
	setLuaSpriteScrollFactor('flashBG', 0, 0)
	setProperty('flashBG.scale.x', 2)
	setProperty('flashBG.scale.y', 2)
	setProperty('flashBG.alpha', 1)
	setObjectCamera('flashBG', 'camGame')
	setObjectOrder('flashBG', 9)
	setProperty('dad.visible', false)
	setProperty('iconP2.visible', false)
	addCharacterToList('bfScared', 'boyfriend')
	setProperty('camHUD.alpha', 0)
end

function onStepHit()
	if curStep == 256 then
		doTweenAlpha('flashFadeOut', 'flash', 0, 6, 'linear')
	end
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('dad.visible', true)
		setProperty('iconP2.visible', true)
		triggerEvent('Change Character', 0, 'bfScared')
	end
	if curStep == 992 then
		doTweenAlpha('theresTheHUD', 'camHUD', 1, 1, 'linear')
	end
	if curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flashBG.visible', false)
	end
	if curStep == 15360 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flashBG.visible', true)
	end
	if curStep == 15616 then
		doTweenAlpha('theresTheHUD', 'camHUD', 0, 2, 'linear')
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('dad.visible', false)
		setProperty('iconP2.visible', false)
		triggerEvent('Change Character', 0, 'bfScared')
	end
	if curStep == 15744 then
		doTweenAlpha('okBye', 'flash', 1, 4, 'linear')
	end
end