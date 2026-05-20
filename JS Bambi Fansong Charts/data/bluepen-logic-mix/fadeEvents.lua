function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "BluePen (Logic Mix)\n\nSong by SuperSonic, OG by Monroe14\n\nChart by Jordan Santiago\n\nSprites by funni_z3mp", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	doTweenColor('dadColorTween', 'dad', '64c8ff', 0.01, 'quadInOut')
	addBloomEffect('dad', 0.3)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	doTweenAlpha('fadeIntro', 'flash', 0, (480/curBpm), 'linear')
end

function onStepHit()
	if curStep == 64 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 640 or curStep == 800 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
	end
	if curStep == 672 then
		doTweenAlpha('sike', 'flash', 0, (480/curBpm), 'linear')
	end
end