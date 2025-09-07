function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	if difficultyName ~= 'Spammier' then
		makeLuaText('Credits', "Earsplitting\n\nSong by BubbleJrReal\n\nChart by Jordan Santiago", 1250, 0, 720)
	else makeLuaText('Credits', "Earsplitting but the song was made hard\n\nSong by 99whois (Original by BubbleJrReal)\n\nChart by Jordan Santiago", 1250, 0, 720)
	end
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flashOut', 'flash', 0, 3, 'linear')
end

function onStepHit()
	if curStep == 256 then
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
end