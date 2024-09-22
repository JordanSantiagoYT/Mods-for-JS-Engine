function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
	setProperty('nonland.alpha', 0)
	setProperty('nonworld.alpha', 0)
	setProperty('boyfriend.alpha', 0)
	setProperty('dad.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0.5, 7, 'linear')
end

function onStepHit()
	if curStep == 128 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('boyfriend.alpha', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('nonland.alpha', 1)
		setProperty('nonworld.alpha', 1)
		setProperty('dad.alpha', 1)
	end
	if curStep == 768 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('nonland.alpha', 0)
		setProperty('nonworld.alpha', 0)
	end
	if curStep == 896 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('nonland.alpha', 1)
		setProperty('nonworld.alpha', 1)
		addBloomEffect('camhud', 0.1)
        	addBloomEffect('camgame', 0.1)
		addChromaticAbberationEffect('camhud', 0.003)
        	addChromaticAbberationEffect('camgame', 0.003)
	end
	if curStep == 1408 then
		cameraFlash('camOther', 'ffffff', 1)
		clearEffects('camHUD')
		clearEffects('camGame')
	end
	if curStep == 2440 then
		cameraFlash('camOther', 'ffffff', 1)
		addBloomEffect('camhud', 0.1)
        	addBloomEffect('camgame', 0.1)
		addChromaticAbberationEffect('camhud', 0.003)
        	addChromaticAbberationEffect('camgame', 0.003)
	end
	if curStep == 2944 then
		cameraFlash('camOther', 'ffffff', 1)
		clearEffects('camHUD')
		clearEffects('camGame')
		setProperty('nonland.alpha', 0)
		setProperty('nonworld.alpha', 0)
	end
	if curStep == 3072 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('nonland.alpha', 1)
		setProperty('nonworld.alpha', 1)
		addBloomEffect('camhud', 0.3)
        	addBloomEffect('camgame', 0.3)
		addChromaticAbberationEffect('camhud', 0.01)
        	addChromaticAbberationEffect('camgame', 0.01)
	end
	if curStep == 3584 then
		cameraFlash('camOther', 'ffffff', 1)
		clearEffects('camHUD')
		clearEffects('camGame')
		setProperty('nonland.alpha', 0)
		setProperty('nonworld.alpha', 0)
		setProperty('boyfriend.alpha', 0)
		setProperty('dad.alpha', 0)
	end
	if curStep == 3616 then
		doTweenAlpha('okBye', 'flash', 1, 2.08, 'linear')
	end
end