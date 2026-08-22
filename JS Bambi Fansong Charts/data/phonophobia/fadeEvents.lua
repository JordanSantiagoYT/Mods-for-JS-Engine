function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Phonophobia (but Spammier)\n\nSong by ThatPizzaTowerFan\n\nChart and Remix by Jordan Santiago\n\nOpponent Sprites by Enzo Polis", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	if difficultyName ~= 'Spammier' then
		setTextString('Credits', 'Phonophobia\n\nSong by ThatPizzaTowerFan\n\nChart by Jordan Santiago\n\nOpponent Sprites by Enzo Polis')
	end

	addChromaticAbberationEffect('camHUD', 0.002)
	addChromaticAbberationEffect('camGame', 0.002)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 29, 'linear')
	if difficulty == 'Spammier' then
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
end

function onStepHit()
	if difficulty == 'Spammier' then
		if curStep == 3840 then
			doTweenY('creditTween', 'Credits', -420, 1.4, 'expoIn')
			doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.4, 'linear')
		end
		if curStep == 32768 then
			doTweenAlpha('okBye', 'flash', 1, 22, 'linear')
		end
	else
		if curStep == 1024 then
			doTweenY('creditTween', 'Credits', 270, (960/curBpm), 'expoOut')
		end
		if curStep == 1216 then
			doTweenY('creditTween', 'Credits', -420, (960/curBpm), 'expoIn')
			doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (960/curBpm), 'linear')
		end
		if curStep == 7168 then
			doTweenAlpha('okBye', 'flash', 1, (480/curBpm), 'linear')
		end
	end
end