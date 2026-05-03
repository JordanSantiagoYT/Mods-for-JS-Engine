function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "The Goddess of Cringe (serialkidd Retake)\n\nSong by Cyklus (ft. serialkidd)\n\nChart by Jordan Santiago\n\nOpponent Sprites & BG by Nael2xd", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaText('Misc', "This is the intro.", 1250, 0, 320)
	setTextAlignment('Misc', 'Center')
	addLuaText('Misc')
	setProperty('Misc.alpha', 0)
	setTextSize('Misc', 60)
	setObjectCamera('Misc', 'camOther')
	setTextBorder('Misc', 3, '000000')
end

function onSongStart()
	doTweenAlpha('miscIn', 'Misc', 1, 1, 'expoOut')
	setTextColor('Misc', 'ffffff')
end
function onStepHit()
	if curStep == 128 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setProperty('Misc.alpha', 0)
	end
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setProperty('Misc.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, (480/curBpm), 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 640 then
		cameraFlash('camOther', '000000', 0.7)
	end
	if curStep == 1376 then
		doTweenAlpha('huh', 'flash', 0.7, (10/curBpm), 'linear')
		doTweenAlpha('huh2', 'flash', 0, (240/curBpm), 'expoIn')
	end
	if curStep == 1660 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm), 'linear')
	end
end