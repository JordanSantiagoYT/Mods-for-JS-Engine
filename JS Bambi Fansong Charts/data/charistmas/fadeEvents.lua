function onCreatePost()
	makeLuaText('Credits', 'Merry Chrimsa!!\n\nSong by BlackTrix\n\nChart by Jordan Santiago', 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setProperty('ytWatermark.alpha', 0)

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camHUD')
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 300, 2, 'expoOut')
end

function onStepHit()
	if curStep == 80 then
		doTweenY('creditTween', 'Credits', -360, 1.1, 'expoIn')
		doTweenAlpha('fadeOut', 'flash', 0, 1.0, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.1, 'expoIn')
	end
	if curStep == 1466 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 1)
	end
end