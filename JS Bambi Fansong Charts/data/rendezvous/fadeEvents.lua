function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Rendezvous\n\nSong by Monroe14\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 16, 'linear')
end

function onStepHit()
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep >= 1140 and curStep < 1152 then
		if curStep % 4 == 0 then
			for i = 0, getProperty('strumLineNotes.length')-1 do
				noteTweenAlpha('noteFade'..i..'1', i, 1, 0.01, 'linear')
				noteTweenAlpha('noteFade'..i..'2', i, 0, 60 / curBpm, 'linear')
			end
		end
	end
	if curStep == 1152 or curStep == 1856 or curStep == 1984 then
		for i = 0, getProperty('strumLineNotes.length')-1 do
			noteTweenAlpha('noteFade'..i..'1', i, 1, 60 / curBpm, 'linear')
		end
	end
	if curStep >= 1792 and curStep < 1856 or curStep >= 1920 and curStep < 1984 then
		if curStep % 8 == 0 then
			for i = 0, getProperty('strumLineNotes.length')-1 do
				noteTweenAlpha('noteFade'..i..'1', i, 1, 0.01, 'linear')
				noteTweenAlpha('noteFade'..i..'2', i, 0, 60 / curBpm, 'linear')
			end
		end
	end
	if curStep == 2816 then
		doTweenAlpha('fadeOut1', 'flash', 1, (240/curBpm) * 1)
	end
	if curStep == 2840 then
		setObjectCamera('flash', 'camGame')
		for i = 0, 7 do
			noteTweenAngle('spin'..i, i, 360, 90 / curBpm, 'expoOut')
		end
	end
	if curStep == 2880 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setObjectCamera('flash', 'camOther')
		setProperty('flash.alpha', 0)
	end
	if curStep == 3904 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenAlpha('fadeOut', 'flash', 1, 0.01)
	end
end

function onTweenCompleted(tag)
	if tag == 'spin0' then
		for i = 0, getProperty('strumLineNotes.length')-1 do
			noteTweenAngle('back'..i, i, 0, 0.0001)
		end
	end
end