function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
 	makeLuaSprite('whiteBG', '', 0, 0)
 	makeGraphic('whiteBG', screenWidth, screenHeight, 'FFFFFF')
 	setObjectOrder('whiteBG', 1)
  	addLuaSprite('whiteBG', true)
  	setLuaSpriteScrollFactor('whiteBG', 0, 0)
   	setProperty('whiteBG.scale.x', 3)
  	setProperty('whiteBG.scale.y', 3)
  	setProperty('whiteBG.alpha', 0)
  	setObjectCamera('whiteBG', 'camGame')
	setObjectOrder('whiteBG', '9')
	setProperty('camGame.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 13, 'linear')
end

function onStepHit()
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('gf.alpha', 0)
		setProperty('dad.alpha', 0)
		setProperty('whiteBG.alpha', 1)
		setProperty('camGame.alpha', 1)
		setProperty('dad.color', 000000)
		setProperty('boyfriend.color', 000000)
	end
	if curStep == 384 then
		doTweenAlpha('oppGreetings', 'dad', 1, 0.7, 'linear')
	end
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('gf.alpha', 1)
		setProperty('whiteBG.alpha', 0)
		setProperty('dad.color', getColorFromHex('ffffff'))
		setProperty('boyfriend.color', getColorFromHex('ffffff'))
	end
	if curStep == 3264 then
		doTweenAlpha('fadeOut', 'flash', 0.9, 3.4, 'linear')
	end
	if curStep == 3328 then
		doTweenAlpha('fadeOut', 'flash', 0, 12.8, 'linear')
	end
	if curStep == 3568 then
		doTweenAlpha('fadeOut', 'flash', 1, 0.8, 'linear')
	end
	if curStep == 3584 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 0)
	end
end

bloomAmt = 1;

function onBeatHit()
	if curBeat >= 128 and curBeat < 376 and curBeat % 2 == 0 or curBeat >= 384 and curBeat < 636 and curBeat % 2 == 0 then
		bloomAmt = 0.3;
	end
end

function onUpdate(elapsed)
	if curBeat >= 128 and curBeat < 376 or curBeat >= 384 and curBeat < 637 then
    		clearEffects('camHUD')
    		clearEffects('camGame')
    		bloomAmt = bloomAmt * math.pow(0.9, elapsed * 60)
   		addBloomEffect('camGame', bloomAmt)
    		addBloomEffect('camHUD', bloomAmt)
	end
end