function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Central (Remix)\n\nSong by Write, OG by Null_y34r\n\nChart by Jordan Santiago\n\nOpponent Sprites by Xaura404", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 36)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 16, 'expoIn')
end
function onStepHit()
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, (480/curBpm), 'expoOut')
		setProperty('flash.alpha', 0)
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 1976 or curStep == 2232 then
		triggerEvent('Screen Shake', (120/curBpm)..', 0.025', (120/curBpm)..', 0.025')
	end
	if curStep == 760 or curStep == 1784 or curStep == 2552 or curStep == 2808 then
		doTweenAlpha('fade', 'flash', 1, (100/curBpm), 'linear')
	end
	if curStep == 768 or curStep == 1792 or curStep == 2560 or curStep == 2816 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 3456 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
end