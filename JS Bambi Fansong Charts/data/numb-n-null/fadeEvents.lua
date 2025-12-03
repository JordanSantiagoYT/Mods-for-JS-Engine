function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Numb N' Null\n\nSong by mortif3rum_\n\nChart by Jordan Santiago\n\nSprites by oriiien", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flashOut', 'flash', 0.1, (240/curBpm) * 7, 'linear')
end

function onStepHit()
	if curStep == 120 then
		doTweenAlpha('flashthing', 'flash', 0.9, (105/curBpm), 'linear')
	end
	if curStep == 128 or curStep == 2048 or curStep == 2624 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 384 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 270, (480/curBpm), 'expoOut')
	end
	if curStep == 448 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1144 then
		doTweenAlpha('fading', 'flash', 1, (120/curBpm), 'linear')
	end
	if curStep == 1152 then
		doTweenAlpha('fading2', 'flash', 0.5, (960/curBpm), 'linear')
		cameraFlash('camOther', '000000', (480/curBpm))
	end
	if curStep == 1376 then
		doTweenAlpha('fading3', 'flash', 1, (480/curBpm), 'linear')
	end
	if curStep == 1408 or curStep == 1536 then
		doTweenAlpha('fadingOut', 'flash', 0, (240/curBpm), 'linear')
	end
	if curStep == 1520 then
		doTweenAlpha('fadeStuffAgain', 'flash', 1, (240/curBpm), 'linear')
	end
	if curStep == 1912 then
		doTweenAlpha('fading4', 'flash', 0.7, (120/curBpm), 'linear')
	end
	if curStep == 1920 then
		doTweenAlpha('fading5', 'flash', 0.3, (240/curBpm), 'linear')
	end
	if curStep == 1952 or curStep == 2528 then
		doTweenAlpha('fading6', 'flash', 1, (480/curBpm), 'linear')
	end
	if curStep == 2016 then
		doTweenAlpha('comeBack', 'flash', 0.2, (420/curBpm), 'linear')
	end
	if curStep == 2044 or curStep == 2620 then
		setProperty('flash.alpha', 0.9)
	end
	if curStep == 2560 then
		doTweenAlpha('comeBackAgain', 'flash', 0.2, (840/curBpm), 'linear')
	end
	if curStep == 3040 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 2, 'linear')
	end
end