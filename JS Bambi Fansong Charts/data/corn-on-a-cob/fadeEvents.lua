function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Corn on a Cob\n\nSong by Pichu the Original\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	--banish the strums to the shadow realm.
	for i = 0, getProperty('strumLineNotes.length')-1 do
		noteTweenY('goAway'..i, i, (downScroll and 120 or -120), 0.01)
	end
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 7, 'linear')
end

local swing = false
function onStepHit()
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1408 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 1920 then
		doTweenAlpha('flTw', 'flash', 1, 12, 'linear')
	end

	--tiny modchart thing because its funny
	if curStep < 240 or curStep >= 1664 and curStep <= 2064 then
		if curStep % 16 == 0 or curStep % 16 == 6 or curStep % 16 == 12 then
			for i = 0, getProperty('strumLineNotes.length')-1 do
				noteTweenAngle('bing'..i, i, 45 * (swing and -1 or 1), 0.01, 'expoOut')
				noteTweenAngle('bump'..i, i, 0, 230 / curBpm, 'expoOut')
			end
			swing = not swing
		end
	end
	if curStep == 160 then
		for i = 0, getProperty('strumLineNotes.length')-1 do
			--i thought 1280 was the height :skull:
			noteTweenY('helloNote'..i, i, (downScroll and 570 or 50), 6, 'sineInOut')
		end
	end
end