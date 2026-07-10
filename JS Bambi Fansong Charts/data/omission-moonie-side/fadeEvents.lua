function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Omission (Moonie Side)\n\nComposed by mooniemooni8166\n\nChart by Jordan Santiago\n\nOpponent Sprites and BG from D&B Nullified", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 36)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('camZooming', true)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 28, 'linear')
end
function onStepHit()
	if curStep == 496 then
		doTweenAlpha('nopefuckyoulol', 'flash', 1, (230/curBpm), 'linear')
	end
	if curStep == 512 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, (480/curBpm), 'expoOut')
	end
	if curStep == 608 then
		doTweenY('creditTween', 'Credits', -480, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 2048 then
		setProperty('flash.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 2304 then
		doTweenAlpha('oksorry', 'flash', 0, (240/curBpm) * 12, 'linear')
	end
	if curStep == 3072 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenAlpha('fadeOut', 'flash', 1, (1/curBpm), 'linear')
	end
end