function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Vulgate (Seriously_2212 Remix)\n\nSong by Seriously_2212\nOG by hortas\nChart by Jordan Santiago\n\nSprites by oriiien", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('dad.alpha', 0)
	runTimer("camOff", 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0.7, (240/curBpm) * 7, 'linear')
	runTimer("camOn", (240/curBpm))
end
function onStepHit()
	if curStep == 112 then
		doTweenAlpha('fadeIntro1', 'flash', 1, (220/curBpm), 'linear')
	end
	if curStep == 128 then
		setProperty('dad.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0.5)
	end
	if curStep == 352 then
		doTweenAlpha('fadeIntro2', 'flash', 0.9, (240/curBpm) * 2, 'linear')
	end
	if curStep == 384 then
		doTweenAlpha('fade3', 'flash', 0, (240/curBpm) * 8, 'linear')
	end
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, 1.6, 'expoOut')
	end
	if curStep == 544 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1344 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 4, 'linear')
	end
end