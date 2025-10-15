function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Imprisonment (V3)\n\nSong by Null_y34r\n\nChart by Jordan Santiago\n\nOpponent Sprites by thenormaltypepokemonreal", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

canTwist = false
function onStepHit()
	if curStep == 512 then
		doTweenAlpha('flTw', 'flash', 0.4, (240/curBpm) * 12, 'linear')
	end
	if curStep == 960 then
		doTweenAlpha('flTw2', 'flash', 1, (240/curBpm) * 3.6, 'linear')
	end
	if curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 1152 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep == 3072 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
	end
	if curStep == 3328 then
		doTweenAlpha('fade3', 'flash', 0, (240/curBpm) * 16, 'linear')
	end
	if curStep == 5120 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 64)
	end
end