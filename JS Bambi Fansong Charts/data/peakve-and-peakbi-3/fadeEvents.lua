function onCreatePost()
	makeLuaText('Credits', "Peakve and Peakbi 3\n\nSong by NextGen\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	for i=0, getProperty('unspawnNotes.length') - 1 do
		if getPropertyFromGroup('unspawnNotes', i, 'strumTime') >= 127230 then
			setPropertyFromGroup('unspawnNotes', i, 'multSpeed', 3);
		end
	end
end

function onStepHit()
	if curStep == 252 or curStep == 508 then
		cameraFade('camOther', 'ffffff', (50/curBpm), false, false)
	end
	if curStep == 256 then
		setProperty('peakbiIcon.alpha', 0)
		setProperty('bambiIcon.alpha', 1)
		cameraFade('camOther', 'ffffff', (50/curBpm), false, true)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 288 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep == 512 then
		setProperty('peakbiIcon.alpha', 1)
		removeLuaSprite('bambiIcon', true)
		setProperty('ytWatermark.alpha', 0)
		cameraFade('camOther', 'ffffff', (50/curBpm), false, true)
	end
end