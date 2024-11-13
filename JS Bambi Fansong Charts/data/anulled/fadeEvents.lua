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
 	setObjectOrder('whiteBG', 4)
  	addLuaSprite('whiteBG', true)
  	setLuaSpriteScrollFactor('whiteBG', 0, 0)
   	setProperty('whiteBG.scale.x', 3)
  	setProperty('whiteBG.scale.y', 3)
  	setProperty('whiteBG.alpha', 0)
  	setObjectCamera('whiteBG', 'camGame')
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 24, 'linear')
end

function onStepHit()
	if curStep == 1408 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('dad.color', 000000)
		setProperty('boyfriend.color', 000000)
  		setProperty('whiteBG.alpha', 1)
	end
	if curStep == 1536 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('dad.color', 000000)
	end
	if curStep == 1664 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('whiteBG.alpha', 0)
		setProperty('dad.color', getColorFromHex('ffffff'))
		setProperty('boyfriend.color', getColorFromHex('ffffff'))
	end
	if curStep == 1920 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('okBye', 'flash', 1, 1, 'linear')
	end
	if curStep == 1968 then
		setObjectCamera('flash', 'camOther')
	end
end