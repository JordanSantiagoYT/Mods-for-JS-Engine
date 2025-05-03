function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Agronomist\n\nSong by Hortas\n\nChart by Jordan Santiago\n\nOpponent Sprites by oriiien", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 13, 'linear')
end

function onStepHit()
	setProperty('camZoomingDecay', 4 / (getProperty('camBopInterval')))
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 260, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 2688 then
		doTweenAlpha('okBye', 'flash', 1, 20, 'linear')
	end
	if curStep >= 768 and curStep <= 1280 or curStep >= 1536 and curStep <= 1776 or curStep >= 1792 and curStep <= 2304 then
		if curStep % 32 == 0 or curStep % 32 == 8 or curStep % 32 == 16 or curStep % 32 == 22 or curStep % 32 == 28 then
			setProperty('camTwistIntensity', 4)
			setProperty('camTwistIntensity2', 4)
			runHaxeCode('game.doTwist();')
			if curStep % 32 == 8 or curStep % 32 == 22 or curStep % 32 == 28 then
				triggerEvent('Add Camera Zoom', 0.03, 0.06)
			end
		end
	end
end