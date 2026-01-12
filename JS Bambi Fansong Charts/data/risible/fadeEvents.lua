ogDadX = 0

function onCreatePost()
	makeLuaSprite('mizuSonic', 'mizuki meets sonic', 0, 0);
	addLuaSprite('mizuSonic', true);
	setLuaSpriteScrollFactor('mizuSonic', 0, 0)
	setProperty('mizuSonic.scale.x', 0.7)
	setProperty('mizuSonic.scale.y', 0.7)
	setProperty('mizuSonic.alpha', 0)
	setObjectCamera('mizuSonic', 'camHUD')
	screenCenter('mizuSonic')

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Risible (V3)\n\nSong by goobie63\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	ogDadX = getProperty('dad.x')
	setProperty('dad.x', -1200)
end

function onSongStart()
	doTweenAlpha('fadeIn', 'flash', 0, (240/curBpm) * 16, 'linear')
end

function onStepHit()
	if curStep == 240 then
		doTweenX('dadComes', 'dad', ogDadX, (230/curBpm), 'backOut')
	end
	if curStep == 256 or curStep == 800 or curStep == 1072 or curStep == 1328 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 280, (480/curBpm), 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 768 then
		doTweenAlpha('REALTRAPSHIT', 'mizuSonic', 1, (30/curBpm))
	end
	if curStep == 800 then
		setProperty('mizuSonic.alpha', 0)
	end
	if curStep == 1328 then
		setProperty('flash.alpha', 1)
	end
	if curStep == 1376 then
		doTweenAlpha('fadeIn2', 'flash', 0, (240/curBpm) * 2, 'expoIn')
	end
	if curStep == 1984 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 14, 'linear')
	end
end

--credits to BFDI 26 for this code
function onUpdatePost(elapsed)
	if curStep > 256 then
		setProperty('dadGroup.x', getProperty('dadGroup.x') + 2 * math.cos(curDecBeat / 8 * math.pi) * elapsed * 60)
		setProperty('dadGroup.y', getProperty('dadGroup.y') + 2 * math.sin(curDecBeat / 8 * math.pi) * elapsed * 80)
	end
end