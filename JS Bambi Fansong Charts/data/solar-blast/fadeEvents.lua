function onCreatePost()
	luadebugmode = true
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 0)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Solar Blast\n\nSong by JackJones1982\n\nChart by Jordan Santiago\n\n", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaSprite('jumpscare', 'microwave-jumpscare', 120, 0);
	scaleObject('jumpscare', 1, 1);
    	setScrollFactor('jumpscare', 0, 0);
	addLuaSprite('jumpscare', false);
	setObjectCamera('jumpscare', 'camOther')
	setProperty('jumpscare.alpha', 0)

    	doTweenColor('boyfriendColorTween', 'boyfriend', '0xff878787', 0.01, 'quadInOut')
    	doTweenColor('dadColorTween', 'dad', '0xff878787', 0.01, 'quadInOut')
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 4, 'linear')
end

stepChainLoop = {2,6,12,14,18,22,28,30,31,34,38,44,46,50,52,54,58,60,61,62,63}
stepBop = 0
function onStepHit()
	if curStep == 48 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 504 or curStep == 1528 then
		doTweenAlpha('fadeIn', 'flash', 0.8, 0.46, 'linear')
	end
	if curStep == 512 or curStep == 800 or curStep == 1024 or curStep == 1536 or curStep == 1824 or curStep == 2048 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep >= 800 and curStep <= 1024 or curStep >= 1824 and curStep <= 2048 then
		if curStep % 128 == 32 or curStep % 128 == 80 or curStep % 128 == 104 then
			stepBop = 1
		end
		if curStep % 128 == 0 or curStep % 128 == 64 or curStep % 128 == 96 or curStep % 128 == 112 then
			stepBop = 2 
		end
	end
	if curStep == 1008 or curStep == 2032 then
		doTweenAlpha('fadeIn2', 'flash', 0.8, 0.94, 'linear')
	end
	if curStep == 2050 then
		doTweenAlpha('okBye', 'flash', 1, 1.3, 'linear')
	end
	if curStep >= 512 and curStep <= 768 or curStep >= 1536 and curStep <= 1794 then
		for i = 0, #stepChainLoop do
			if curStep % 64 == stepChainLoop[i] then
				triggerEvent('Add Camera Zoom', 0.03, 0.06)
				break
			end
		end
	end
	if curStep >= 768 and curStep <= 1008 or curStep >= 1824 and curStep <= 2032 then
		if curStep % stepBop == 0 and not (curStep % (getProperty('camBopInterval') * 4) == 0) then
			triggerEvent('Add Camera Zoom', 0.03, 0.06)
		end
	end
end

function onBeatHit()
	setProperty('camZoomingDecay', 4 / (getProperty('camBopInterval')))
	if curBeat >= 0 and curBeat <= 128 or curBeat >= 256 and curBeat <= 384 then
		if curBeat % 4 == 2 then
			setProperty('camTwistIntensity', 4)
			setProperty('camTwistIntensity2', 4)
			runHaxeCode('game.doTwist();')
		end
	end
end