function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Unboundhusk\n\nSong by Null_y34r\n\nChart by Jordan Santiago\n\nOpponent Sprites by Enzo Polis\n\nBackground by TheTrueAccount_2", 1250, 0, 720)
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
	doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 14, 'linear')
end

function onStepHit()
	if curStep == 480 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep == 5120 then
		doTweenAlpha('fakeout', 'flash', 1, 14.98, 'linear')
	end
	if curStep == 5624 then
		doTweenAlpha('TROLLED', 'flash', 0, 0.2, 'linear')
	end
	if curStep == 5648 then
		doTweenAlpha('TROLLED', 'flash', 1, 2, 'linear')
	end
end