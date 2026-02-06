function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Resplendent\n\nSong by julia!\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('dad.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 8, 'linear')
end
function onStepHit()
	if curStep == 128 or curStep == 640 or curStep == 1536 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setProperty('dad.alpha', 1)
	end
	if curStep == 128 then
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 192 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep >= 632 and curStep < 640 then
		setProperty('flash.alpha', (curStep % 2 == 0 and 1 or 0))
	end
	if curStep == 864 then
		doTweenAlpha('fadeThing', 'flash', 0.9, (240/curBpm) * 2, 'expoIn')
	end
	if curStep == 896 then
		doTweenAlpha('fadeThing', 'flash', 0, (240/curBpm) * 8, 'expoIn')
	end
	if curStep == 2848 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 14, 'linear')
	end
end