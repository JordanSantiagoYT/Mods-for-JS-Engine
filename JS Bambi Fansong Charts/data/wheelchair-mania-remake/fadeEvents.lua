ogDadX = 0

function onCreatePost()
	makeLuaSprite('DavePlush', 'DavePlush', 0, 0);
	addLuaSprite('DavePlush', true);
	setLuaSpriteScrollFactor('DavePlush', 0, 0)
	setProperty('DavePlush.scale.x', 0.2)
	setProperty('DavePlush.scale.y', 0.2)
	setProperty('DavePlush.alpha', 0)
	setObjectCamera('DavePlush', 'camOther')
	screenCenter('DavePlush')

	makeLuaSprite('bambiWhat', 'sybau but bambi', 0, 0);
	addLuaSprite('bambiWhat', true);
	setLuaSpriteScrollFactor('bambiWhat', 0, 0)
	setProperty('bambiWhat.scale.x', 1)
	setProperty('bambiWhat.scale.y', 1)
	setProperty('bambiWhat.alpha', 0)
	setObjectCamera('bambiWhat', 'camHUD')
	screenCenter('bambiWhat')

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Wheelchair Mania (Remake)\n\nSong by ThatPizzaTowerFan\n\nChart by Jordan Santiago\n\nGirlfriend Sprites by Cute_Soda99", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	runTimer('camOff', 0)
	setProperty('camHUD.alpha', 0.001)
	ogDadX = getProperty('dad.x')
	setProperty('dad.x', ogDadX-400)
	addChromaticAbberationEffect('dad', 0.002)
	--addChromaticAbberationEffect('iconP2', 0.01)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0.7, (240/curBpm) * 4, 'linear')
	runTimer('camOn', (240/curBpm) * 12)
end

canTwist = false
function onStepHit()
	if curStep == 64 or curStep == 192 or curStep == 1600 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('camHUD.alpha', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 64 then
		addChromaticAbberationEffect('iconP2', 0.01)
	end
	if curStep == 160 then
		setProperty('isCameraOnForcedPos', true)
		doTweenX('cameraToDad', 'camFollow', ogDadX + 400, (320/curBpm), 'expoInOut')
		doTweenX('hiDad', 'dad', ogDadX, (320/curBpm), 'expoInOut')
	end
	if curStep == 448 then
		doTweenAlpha('dadIn', 'dad', 1, (240/curBpm) * 4, 'expoIn')
	end
	if curStep == 192 then
		setProperty('isCameraOnForcedPos', false)
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
		setProperty('camHUD.alpha', 1)
	end
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 703 then canTwist = true end
	if curStep == 960 then canTwist = false end
	if curStep == 1472 then
		setProperty('bambiWhat.alpha', 1)
		setProperty('camHUD.alpha', 1)
		setProperty('dad.alpha', 0)
	end
	if curStep == 1536 then
		setProperty('DavePlush.alpha', 0.2)
		setProperty('camGame.alpha', 0.001)
		setProperty('camHUD.alpha', 0.001)
		setProperty('bambiWhat.alpha', 0)
		setProperty('camZooming', false)
		doTweenScale('DavePlushJumpscare', 'DavePlush', 1, (240/curBpm) * 4, 'expoIn')
		doTweenAlpha('DavePlushJumpscare2', 'DavePlush', 1, (240/curBpm) * 3.9, 'expoIn')
	end
	if curStep == 1600 then
		setProperty('dad.alpha', 1)
		setProperty('DavePlush.alpha', 0)
		setProperty('camGame.alpha', 1)
		setProperty('camZooming', true)
		addChromaticAbberationEffect('dad', 0.002)
	end
	if curStep == 1888 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
	end
end

function onEvent(n, v1, v2)
	if n == 'Add Camera Zoom' and canTwist then
		twistIntensity = tonumber(v1) / 0.015
		if twistIntensity > 2 then
			setProperty('camTwistIntensity', twistIntensity)
			setProperty('camTwistIntensity2', twistIntensity)
			runHaxeCode('game.doTwist();')
		end
	end
end
function onUpdate()
	if curStep >= 1536 and curStep < 1600 then
		cameraShake('camOther', tonumber(getProperty('DavePlush.scale.x')) / 40, 0.03)
	end
end