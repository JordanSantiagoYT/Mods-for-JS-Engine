function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Perish!, Grind it down till its ash!\n\nSong by MrLambiLOL\n\nChart by Jordan Santiago\n\nSprites by TheTrueAccount_2", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 7, 'linear')
end

function onStepHit()
	if curStep == 128 then
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 192 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 768 or curStep == 896 or curStep == 1056 or curStep == 1120 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 1056 then
		setProperty('flash.alpha', 1)
	end
	if curStep == 1120 then
		setProperty('flash.alpha', 0)
		doTweenAlpha('byeFade', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
end

--credits to BFDI 26 for this code
function onUpdatePost(elapsed)
	setProperty('dadGroup.x', getProperty('dadGroup.x') + 2 * math.cos(curDecBeat / 4 * math.pi) * elapsed * 60 * playbackRate)
	setProperty('dadGroup.y', getProperty('dadGroup.y') + 2 * math.sin(curDecBeat / 4 * math.pi) * elapsed * 80 * playbackRate)
	if not mustHitSection then cameraSetTarget('dad') end
end