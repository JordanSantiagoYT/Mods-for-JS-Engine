function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Noise\n\nSong by Kiruno_lol\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 4, 'linear')
end

function onStepHit()
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1536 then
		doTweenAlpha('byeFade', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
end

--credits to BFDI 26 for this code
function onUpdatePost(elapsed)
	setProperty('dadGroup.x', getProperty('dadGroup.x') + 2 * math.cos(curDecBeat / 4 * math.pi) * elapsed * 30 * playbackRate)
	if not mustHitSection then cameraSetTarget('dad') end
end