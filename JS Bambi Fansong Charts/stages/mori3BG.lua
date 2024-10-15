function onCreate()
	makeLuaSprite('BG4', 'endoftheworldDARKER/12141bruhhh', -2500, -700);
	setScrollFactor('BG4', 0.9, 0.9);
	scaleObject('BG4', 4,4)
	addGlitchEffect('BG4', 2, 2, 0.1); 

	makeAnimatedLuaSprite('GIF', 'endoftheworldDARKER/sex', -2000, -1250);
	addAnimationByPrefix('GIF', 'sex', 'original (1)_gif', 30, true)
	setScrollFactor('GIF', 0.9, 0.9);
	scaleObject('GIF', 8,8)
	setProperty('GIF.alpha', 0)

	addLuaSprite('BG4', false);
	addLuaSprite('GIF', false);

	makeLuaSprite('edolando', 'endoftheworldDARKER/edolando', -200, 750);
	scaleObject('edolando', 1, 1)
	addLuaSprite('edolando', false);

	doTweenAlpha('4Alpha4', 'BG4', 0.38, 0.0001, "lineal")

	-- shaders!!
	initLuaShader("CoolStarfield")
	initLuaShader("cosmosFbmNoise")

	--graphics for shaders

	makeLuaSprite('purple', 'moribund3purp', -1600, -900);
	setLuaSpriteScrollFactor('purple', 0, 0);
	scaleObject('purple', 3.5, 3.5);
	setProperty('purple.alpha', 0)
	addLuaSprite('purple', false)

	setSpriteShader("purple", "cosmosFbmNoise")

	makeLuaSprite('awesomeStarfield', 'moribund3purp', -1600, -900);
	setLuaSpriteScrollFactor('awesomeStarfield', 0, 0);
	scaleObject('awesomeStarfield', 3.5, 3.5);
	setProperty('awesomeStarfield.alpha', 0)
	addLuaSprite('awesomeStarfield', false)

	setSpriteShader("awesomeStarfield", "CoolStarfield")
end

didStuff = false
function onStepHit()
	if curStep == 768 or curStep == 10496 or curStep == 16128 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('BG4.alpha', 0)
		setProperty('purple.alpha', 1)
	end
	if curStep >= 1792 and curStep <= 1800 or curStep >= 11264 and curStep <= 11272 or curStep >= 16384 and curStep <= 16391 then
		if not didStuff then
			didStuff = true
			setProperty('BG4.alpha', 0)
			setProperty('awesomeStarfield.alpha', 1)
			cameraFlash('camOther', 'ffffff', 1)
			addBloomEffect('camhud', 0.12)
			addBloomEffect('camgame', 0.12)
			addBlockedGlitchEffect('camHUD')
			addBlockedGlitchEffect('camGame')
		end
	end
	if curStep >= 1801 and curStep <= 1808 or curStep >= 5896 and curStep <= 5904 or curStep == 10760 or curStep >= 11273 and curStep <= 11280 or curStep >= 15369 and curStep <= 15376 or curStep >= 16392 and curStep <= 16400 or curStep >= 20489 and curStep <= 20496 then
		if didStuff then didStuff = false end
	end
	if curStep >= 5888 and curStep <= 5895 or curStep >= 20480 and curStep <= 20488 then
		if not didStuff then
			didStuff = true
			cameraFlash('camOther', 'ffffff', 1)
			clearEffects('camHUD')
			clearEffects('camGame')
			addBloomEffect('camhud', 0.12)
			addBloomEffect('camgame', 0.12)
		end
	end
	if curStep >= 9984 and curStep <= 9992 or curStep >= 15360 and curStep <= 15368 or curStep == 10752 then
		if not didStuff then
			didStuff = true
			cameraFlash('camOther', 'ffffff', 1)
			setProperty('BG4.alpha', 1)
			setProperty('GIF.alpha', 0)
			setProperty('purple.alpha', 0)
			setProperty('awesomeStarfield.alpha', 0)
			clearEffects('camHUD')
			clearEffects('camGame')
		end
	end
	if curStep >= 24576 and curStep <= 24580 then
		if not didStuff then
			didStuff = true
			clearEffects('camHUD')
			clearEffects('camGame')
		end
	end
	if curStep == 24640 then
		setProperty('BG4.alpha', 1)
		setProperty('GIF.alpha', 0)
		setProperty('purple.alpha', 0)
		setProperty('awesomeStarfield.alpha', 0)
	end
end

function onUpdate(elapsed)
	setShaderFloat('purple', 'iTime', getSongPosition()/500)
	setShaderFloat('awesomeStarfield', 'iTime', getSongPosition()/300)
end