function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Eclipse (Spaci's Part Remastered)\n\nSong by Pyxlmated\n\nChart by Jordan Santiago\n\nSpaci Sprites by @atpengineer2002 (YT)", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	--shaders
	addShaders()
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 19, 'linear')
	doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
end

function onStepHit()
	if curStep == 480 then
		doTweenY('creditTween', 'Credits', -360, 1.2, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.2, 'linear')
	end
	if curStep == 2560 or curStep == 3712 or curStep == 5632 or curStep == 6144 then
		cameraFlash('camOther', 'ffffff', 1)
	end
	if curStep == 6400 then
		doTweenAlpha('okBye', 'flash', 1, 9.6, 'linear')
	end
end

function addShaders()
	addChromaticAbberationEffect ('camhud', 0.003)
	addChromaticAbberationEffect ('camgame', 0.003)
	addVCREffect('camgame')
	addBloomEffect ('camhud', 0.003)
	addBloomEffect ('camgame', 0.003)
	addGrayscaleEffect('camHUD');
	addGrayscaleEffect('camGame');
end