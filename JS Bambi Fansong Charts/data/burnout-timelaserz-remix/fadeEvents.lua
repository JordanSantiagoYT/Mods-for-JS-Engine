local ogBFX = 0
local ogDadX = 0

function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "BURNOUT (TimeLaserz Remix)\n\nRemix by TimeLaserz, OG by Monroe14\n\nChart by Jordan Santiago\n\nOpponent Sprites by TheTrueAccount_2", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	ogBFX = getProperty('boyfriend.x')
	ogDadX = getProperty('dad.x')
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 16, 'linear')
end
canRedVig = true
function onStepHit()
	if curStep == 512 then
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1520 or curStep == 4080 then
		canRedVig = false
	end
	if curStep == 2032 then
		canRedVig = true
		setProperty('flash.alpha', 0.6)
		doTweenAlpha('flBye', 'flash', 0, (240/curBpm), 'linear')
	end
	if curStep == 2560 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
		setProperty('camHUD.alpha', 0.001)
	end
	if curStep == 2816 then
		doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 15, 'linear')
	end
	if curStep == 3072 then
		setProperty('bg.alpha', 0)
		setProperty('plat.alpha', 0)
		setProperty('flash.alpha', 1)
	end
	if curStep == 3200 then
		doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 4, 'linear')
	end
	if curStep == 3312 or curStep == 4080 then
		cameraFade('camOther', 'ffffff', (220/curBpm), true, false)
	end
	if curStep == 3328 then
		cameraFade('camOther', 'ffffff', (120/curBpm), true, true)
		setProperty('bg.alpha', 1)
		setProperty('plat.alpha', 1)
		setProperty('vig.alpha', 0.9)
		setProperty('camHUD.alpha', 1)
		setProperty('boyfriend.x', ogBFX - 80)
		setProperty('dad.x', ogDadX + 1900)
		setObjectOrder('dadGroup', 0)
	end
	if curStep == 4096 then
		cameraFade('camOther', 'ffffff', (120/curBpm), true, true)
		setProperty('flash.alpha', 1)
	end
end

function onBeatHit()
	if getProperty('camZooming') and canRedVig and curBeat % getProperty('camBopInterval') == 0 then
		setProperty('redVig.alpha', 1)
		doTweenAlpha('rvBye', 'redVig', 0, (120/curBpm), 'linear')
	end
end

function onEvent(n)
	if n == 'Add Camera Zoom' and canRedVig then
		setProperty('redVig.alpha', 1)
		doTweenAlpha('rvBye', 'redVig', 0, (120/curBpm), 'linear')
	end
end