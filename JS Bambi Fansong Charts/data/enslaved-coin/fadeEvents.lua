-- so this contains all the lua scripts because lua doesnt like when you flesh it out across several scripts

ogDadX = 0
ogDadY = 0
xMoveSpeed = 0
yMoveSpeed = 1

function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Enslaved Coin\n\nSong by Ugadi Enterprises\n\nChart by Jordan Santiago\n\nSangtraan by @sangtraan", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	setProperty('oppSprite.alpha', 0)
	ogDadX = getProperty('oppSprite.x')
	ogDadY = getProperty('oppSprite.y')

	makeLuaSprite('TBC', 'TO_BE_CONTINUED', 1280, 480);
	addLuaSprite('TBC', true);
	setLuaSpriteScrollFactor('TBC', 0, 0)
	scaleObject('TBC', 0.4, 0.4)
	setProperty('TBC.alpha', 1)
	setObjectCamera('TBC', 'camOther')

	makeLuaSprite('CT', 'color bars', 0, 0);
	addLuaSprite('CT', true);
	setLuaSpriteScrollFactor('CT', 0, 0)
	scaleObject('CT', 1, 0.8)
	setProperty('CT.alpha', 0)
	setObjectCamera('CT', 'camOther')
end

function onSongStart()
	doTweenAlpha('flashOut', 'flash', 0, (240/curBpm) * 32, 'linear')
end

function onStepHit() 
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setProperty('oppSprite.alpha', 1)
		doTweenY('creditTween', 'Credits', 270, (480/curBpm), 'expoOut')
	end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1024 or curStep == 2208 or curStep == 2464 or curStep == 3072 then
		xMoveSpeed = 2
		yMoveSpeed = 2
		maxShake = 0.025
	end
	if curStep == 1536 or curStep == 2242 or curStep == 2496 or curStep == 4000 then
		xMoveSpeed = 0
		yMoveSpeed = 1
		maxShake = 0.015
		cameraTwisty = false
	end
	if curStep == 2216 or curStep == 2472 then
		xMoveSpeed = 3
		yMoveSpeed = 3
		maxShake = 0.04
	end
	if curStep == 2224 or curStep == 2480 then
		xMoveSpeed = 5
		yMoveSpeed = 5
		maxShake = 0.05
	end
	if curStep == 1024 or curStep == 3072 then
		cameraTwisty = true
	end
	if curStep == 4088 then
		setProperty('cameraSpeed', 100)
		doTweenX('center', 'camFollow', 100, (120/curBpm), 'expoIn')
		doTweenY('center2', 'camFollow', 0, (120/curBpm), 'expoIn')
	end
	if curStep == 4092 then
		doTweenX('TOBECONTINUEDLOL', 'TBC', 30, (60/curBpm))
	end
	if curStep == 4096 then
		xMoveSpeed = 0; yMoveSpeed = 0;
		addGrayscaleEffect('camGame')
		addGrayscaleEffect('camHUD')
	end
	if curStep == 4120 then
		setProperty('CT.alpha', 1)
	end
	if curStep == 4128 then
		cameraFlash('camOther', 'FF0000', 0.7)
		setProperty('CT.alpha', 0)
		setProperty('TBC.alpha', 0)
		setProperty('cameraSpeed', 1)
		clearEffects('camHUD')
		clearEffects('camGame')
		xMoveSpeed = 16
		yMoveSpeed = 16
		maxShake = 0.15
		cameraTwisty = true
	end
	if curStep == 4384 then
		cameraFlash('camOther', 'FF0000', 0.7)
		xMoveSpeed = 50
		yMoveSpeed = 50
		maxShake = 0.5
		cameraTwisty = true
	end
	if curStep == 4640 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setProperty('oppSprite.alpha', 0)
		setProperty('cameraSpeed', 1)
		xMoveSpeed = 1
		yMoveSpeed = 1
		maxShake = 0.015
		cameraTwisty = false
	end
	if curStep == 4896 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 18, 'linear')
	end
	if cameraTwisty then
		if curStep % 16 == 4 or curStep % 16 == 12 then
			doTweenAngle('camBackNormal', 'camGame', 0, (60/curBpm), 'expoIn')
			doTweenAngle('hudBackNormal', 'camHUD', 0, (60/curBpm), 'expoIn')
		end
		if curStep % 16 == 0 or curStep % 16 == 8 then
			doTweenAngle('crazyGameTwist', 'camGame', (curStep % 16 == 0 and 15 or -15), (60/curBpm), 'expoOut')
			doTweenAngle('crazyHudTwist', 'camHUD', (curStep % 16 == 0 and 15 or -15), (60/curBpm), 'expoOut')
		end
	end
end

function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
	doTweenX('opponentmoveX', 'oppSprite', ogDadX - 200*math.sin((currentBeat*0.375*xMoveSpeed)*math.pi), 0.05)
	doTweenY('opponentmove', 'oppSprite', ogDadY - 200*math.sin((currentBeat*0.75*yMoveSpeed)*math.pi), 0.05)
end

shake = 0.0
shakeAmt = 0.002
maxShake = 0.015
function opponentNoteHit()
	if shake < maxShake then
		shake = shake + shakeAmt;
	else shake = maxShake;
	end
end
function onUpdatePost(elapsed)
	if shake > 0 then
		triggerEvent('Screen Shake', '0.02, '..shake, '0.02, '..shake)
	end
	shake = 0
end