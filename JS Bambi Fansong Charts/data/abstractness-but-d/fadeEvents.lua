function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Abstractness but d\n\nSong by ourplebop\n\nChart by Jordan Santiago\n\nFSM Sprites by mrvidyas", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 15.6, 'linear')
end

function onStepHit()
	if curStep == 128 then
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 160 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 2816 then
		doTweenAlpha('flTw', 'flash', 1, 2.2, 'linear')
	end
end
function onBeatHit()
	if curBeat > 64 and curBeat < 128 or curBeat > 384 and curBeat < 448 then
		if curBeat % 2 == 1 then
			for i = 0, 7 do
				noteTweenAngle('spin'..i, i, 360, 110 / curBpm, 'expoOut')
			end
		end
	end
end
function onTweenCompleted(tag)
	if tag == 'spin0' then
		for i = 0, getProperty('strumLineNotes.length')-1 do
			noteTweenAngle('back'..i, i, 0, 0.0001)
		end
	end
end