function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 0)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Sonorous (Re-imagined)\n\nSong by Null_y34r, Remix by absc3\n\nChart by Jordan Santiago\n\nOpponent Sprites by absc3\n\nBF sprites by azuwure_ (twitter)", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	addChromaticAbberationEffect('camHUD', 0.002)
	addChromaticAbberationEffect('camGame', 0.002)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 240, 2, 'expoOut')
end

function onStepHit()
	if curStep == 64 then
		doTweenY('creditTween', 'Credits', -420, 1.4, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.4, 'linear')
	end
	if curStep == 240 then
		doTweenAlpha('byeFade', 'flash', 0.9, 0.86, 'linear')
	end
	if curStep == 256 or curStep == 1288 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 500 or curStep == 756 then
		doTweenAlpha('fadeIn', 'flash', 1, 0.21, 'linear')
	end
	if curStep == 504 or curStep == 760 then
		doTweenAlpha('fadeIn', 'flash', 0, 0.42, 'expoIn')
	end
	if curStep == 2304 then
		doTweenAlpha('okBye', 'flash', 1, 14, 'linear')
	end
end