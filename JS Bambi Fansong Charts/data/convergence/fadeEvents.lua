function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Convergence\n\nSong by julia\n\nChart by Jordan Santiago\n\nSprites by HalfJoke\n\nMINOR FLASHING WARNING", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('dad.alpha', 0)
	setProperty('boyfriend.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 7, 'linear')
end

stepLoop = {0, 8, 16, 22, 28, 32, 40, 46, 50, 60}
function onStepHit()
	if curStep <= 768 or curStep >= 1024 then
		setProperty('camZoomingDecay', 4 / (getProperty('camBopInterval')))
	end
	if curStep == 128 then
		doTweenAlpha('bfIn', 'boyfriend', 1, 7, 'linear')
		doTweenAlpha('dadIn', 'dad', 1, 7, 'linear')
	end
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 240, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep >= 496 and curStep < 512 then
		if curStep % 2 == 0 then doTweenAlpha('flashThing', 'flash', 0.5, 0.05, 'linear') end
		if curStep % 2 == 1 then doTweenAlpha('flashThing2', 'flash', 0, 0.05, 'linear') end
	end
	if curStep >= 768 and curStep < 1024 then
		setProperty('camZoomingDecay', 2)
		setProperty('camTwistIntensity', 4)
		setProperty('camTwistIntensity2', 4)
		for i = 0, #stepLoop do
			if curStep % 64 == stepLoop[i] then
				runHaxeCode('game.doTwist();')
				if not (curStep % (getProperty('camBopInterval') * 4) == 0) then
					triggerEvent('Add Camera Zoom', 0.03, 0.06)
				end
				break
			end
		end
	end
	if curStep > 1792 and curStep <= 2304 then
		if curStep % 32 == 28 then
			triggerEvent('Add Camera Zoom', 0.03, 0.06)
			runHaxeCode('game.doTwist();')
		end
	end
	if curStep == 2560 then
		doTweenAlpha('flTw', 'flash', 1, 14.3, 'linear')
	end

	--flashing
	if curStep == 256 or curStep == 768 or curStep == 1024 or curStep == 1280 or curStep == 1792 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
end