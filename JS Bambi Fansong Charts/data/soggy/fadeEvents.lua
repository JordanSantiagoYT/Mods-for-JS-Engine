function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "SOGGY\n\nSong by Monroe14\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0.4, (240/curBpm) * 16, 'linear')
end

canBop = false
-- im not using a shit ton of events Sorry
bopLoop = {12, 24, 44, 56}
function onStepHit()
	if curStep == 256 then
		canBop = true
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenAlpha('fadeThing', 'flash', 0, (120/curBpm), 'linear')
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep == 1264 then
		canBop = false
	end
	if curStep == 2556 then
		doTweenAlpha('fadeThing2', 'flash', 1, (60/curBpm), 'linear')
	end
	if curStep == 2560 then
		doTweenAlpha('fadeThing3', 'flash', 0, (240/curBpm) * 16, 'linear')
	end
	if curStep == 3584 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 4)
	end
	if canBop then
		for i = 0, #bopLoop do
			if curStep % 64 == bopLoop[i] then
				triggerEvent('Add Camera Zoom', 0.03, 0.06)
				break
			end
		end
	end
end