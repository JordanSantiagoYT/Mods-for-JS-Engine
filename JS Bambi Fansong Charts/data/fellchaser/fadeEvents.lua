function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "FELLCHASER\n\nComposed by Blokbrine\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	makeLuaSprite('upbg', '', 0, -120)
	makeGraphic('upbg', 1920, 240, '000000')
	setObjectCamera('upbg', 'hud')
	addLuaSprite('upbg', false)

	makeLuaSprite('lowbg', '', 0, 600)
	makeGraphic('lowbg', 1920, 240, '000000')
	setObjectCamera('lowbg', 'hud')
	addLuaSprite('lowbg', false)

	setProperty('camZoomingDecay', 2.5)
	setProperty('camZooming', true)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 3, 'linear')
end
function onStepHit()
	if curStep == 64 then
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 96 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 215 or curStep == 239 or curStep == 303 or curStep == 495 or curStep == 535 or curStep == 559 then
		runTimer('camOff', 0)
	end
	if curStep == 224 or curStep == 256 or curStep == 320 or curStep == 512 or curStep == 544 or curStep == 576 then
		runTimer('camOn', 0)
	end
	if curStep == 576 then
		doTweenAlpha('fadeOut', 'flash', 1, (220/curBpm) * 2, 'linear')
	end
end