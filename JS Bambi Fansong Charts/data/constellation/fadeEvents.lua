function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 90)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Constellation\n\nSong by daniel_is_cool001\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	initLuaShader('WhiteAndTransparent');
	setSpriteShader('dad', 'WhiteAndTransparent')
	setShaderBool('dad', 'invert', true)
	setProperty('dad.alpha', 0)
	addBloomEffect('dad', 0.06)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 1.8, 'linear')
end

function onStepHit()
	if curStep == 80 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 32 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('dad.alpha', 1)
	end
	if curStep == 1984 then
		setObjectCamera('Credits', 'camOther')
		doTweenAlpha('okBye', 'flash', 1, 9, 'linear')
	end
end