function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Broken Tool\n\nSong by NoonPersoner\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 32, 'linear')
end
function onStepHit()
	if curStep == 512 or curStep == 3072 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 512 then
		setProperty('opSprite.alpha', 1)
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 640 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 5120 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 4, 'linear')
	end
end

--credits to BFDI 26 for this code
function onUpdatePost(elapsed)
	setProperty('oppSprite.x', getProperty('oppSprite.x') + 2 * math.cos(curDecBeat / 8 * math.pi) * elapsed * 60)
	setProperty('oppSprite.y', getProperty('oppSprite.y') + 2 * math.sin(curDecBeat / 8 * math.pi) * elapsed * 80)
end