function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Transcendent (PISSED ON)\n\nComposed by pi.ssentinel\n\nChart by Jordan Santiago\n\nOpponent Sprites by oriiien", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('camZooming', true)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 12, 'linear')
end
function onStepHit()
	if curStep == 248 then
		doTweenAlpha('fadeNo', 'flash', 1, (55/curBpm), 'linear')
	end
	if curStep == 252 then
		doTweenAlpha('fadeNo2', 'flash', 0, (55/curBpm), 'linear')
	end
	if curStep == 256 then
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 288 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 568 or curStep == 1144 then
		doTweenAlpha('fadeWhoops', 'flash', 1, (120/curBpm), 'linear')
	end
	if curStep == 576 then
		doTweenAlpha('fadeWhoops2', 'flash', 0, (240/curBpm) * 2.5, 'linear')
	end
	if curStep == 636 then
		doTweenAlpha('fadeWhoops3', 'flash', 1, (40/curBpm), 'expoOut')
	end
	if curStep == 640 then
		doTweenAlpha('fadeWhoops4', 'flash', 0, (240/curBpm) * 4, 'linear')
	end
	if curStep == 768 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 1152 then
		doTweenAlpha('fadeWhoops5', 'flash', 0, (240/curBpm) * 6, 'linear')
	end
	if curStep == 1280 then
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 1)
		doTweenAlpha('fadeWhoops6', 'flash', 0, (240/curBpm) * 4, 'linear')
	end
	if curStep == 1536 then
		setObjectCamera('flash', 'camOther')
	end
	if curStep == 1792 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 16, 'linear')
	end
end