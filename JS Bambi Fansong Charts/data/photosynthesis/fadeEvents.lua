function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Photosynthesis\n\nSong by Hortas\n\nChart by Jordan Santiago\n\nSprites by oriiien", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 9, 'linear')
end

function onStepHit()
	if curStep == 128 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
    		doTweenColor('bfColor', 'boyfriend', 'b18dff' , 0.1, 'linear');
	end
	if curStep == 160 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 696 then
		doTweenAlpha('okBye', 'flash', 1, 0.56, 'linear')
	end
	if curStep == 704 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 1856 then
		doTweenAlpha('okBye', 'flash', 1, 10, 'linear')
	end
end