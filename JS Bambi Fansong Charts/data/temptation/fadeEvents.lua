function onCreatePost()

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Temptation\n\nSong by Monroe14\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaSprite('check', 'sonic-checkpoint', 0, 0);
	addLuaSprite('check', true);
	setLuaSpriteScrollFactor('check', 0, 0)
	setProperty('check.scale.x', 0.7)
	setProperty('check.scale.y', 0.7)
	setProperty('check.alpha', 0)
	setObjectCamera('check', 'camOther')
	screenCenter('check')

	makeLuaText('Misc', "Ready to PLAY!", 1250, 0, 320)
	setTextAlignment('Misc', 'Center')
	addLuaText('Misc')
	setProperty('Misc.alpha', 0)
	setTextSize('Misc', 60)
	setObjectCamera('Misc', 'camOther')
	setTextBorder('Misc', 3, '000000')
end

function onSongStart()
	setProperty('Misc.alpha', 1)
	doTweenAlpha('loadIn', 'Misc', 0, 1.1, 'expoOut')
	setTextColor('Misc', 'ffffff')
end
function onStepHit()
	if curStep == 16 then
		doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 16, 'linear')
	end
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1304 then
		doTweenAlpha('loadIn2', 'Misc', 1, 0.4, 'expoOut')
		setTextString('Misc', 'Round')
	end
	if curStep == 1308 then
		setTextString('Misc', 'Round 2!')
	end
	if curStep == 1312 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('Misc.alpha', 0)
		setProperty('flash.alpha', 1)
	end
	if curStep == 1436 then
		doTweenAlpha('checky', 'check', 1, 0.1, 'linear')
	end
	if curStep == 1440 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('check.alpha', 0)
		setProperty('flash.alpha', 0)
	end
	if curStep == 2528 then
		doTweenAlpha('fadeIn1', 'flash', 1, (480/curBpm)*2, 'linear')
	end
end