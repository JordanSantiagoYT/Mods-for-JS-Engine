function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Deranged (Stupendy's Remix)\n\nSong by stupendy\n\nChart by Jordan Santiago\n\nALL Assets by Xaura404", 1250, 0, 740)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	makeLuaText('Misc', "4/4", 1250, 0, 720)
	setTextAlignment('Misc', 'Center')
	addLuaText('Misc')
	setProperty('Misc.alpha', 1)
	setTextSize('Misc', 60)
	setObjectCamera('Misc', 'camOther')
	setTextBorder('Misc', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 2, 'linear')
end
function onStepHit()
	if curStep == 128 then
		doTweenY('creditTween', 'Credits', 240, (240/curBpm), 'expoOut')
	end
	if curStep == 160 then
		doTweenY('creditTween', 'Credits', -480, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 240 or curStep == 1072 then
		doTweenY('hiMisc', 'Misc', 320, (180/curBpm), 'expoOut')
	end
	if curStep == 256 or curStep == 1088  then
		setTextString('Misc', '5/4')
		setProperty('Misc.color', getColorFromHex('fa6e64'))
		doTweenColor('miscWhite', 'Misc', '0xffffffff', (240/curBpm), 'expoOut')
		setProperty('Misc.scale.x', 1.25)
		setProperty('Misc.scale.y', 1.25)
		doTweenScale('miscOut', 'Misc', 1, (120/curBpm), 'expoOut')
	end
	if curStep == 296 or curStep == 1128 then
		doTweenY('byeMisc', 'Misc', 740, (240/curBpm), 'expoIn')
	end
	if curStep == 576 or curStep == 1664 then
		setTextString('Misc', '4/4')
	end
	if curStep == 1664 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
	end
end