function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camGame')

	makeLuaText('Credits', "Fanatic\n\nSong by BraxtonBlackTrix\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onStepHit()
	if curStep == 32 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 300, 2, 'expoOut')
	end
	if curStep == 96 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 2144 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
	end
	if curStep == 2160 then
		setObjectCamera('flash', 'camOther')
	end
	if curStep >= 32 and curStep < 544 or curStep >= 1568 and curStep < 2080 then
		if curStep % 16 == 6 or curStep % 16 == 12 then
			triggerEvent('Add Camera Zoom', 0.03, 0.06)
		end
	end
end