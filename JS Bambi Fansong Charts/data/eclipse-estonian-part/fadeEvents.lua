function onCreatePost()
	makeLuaText('Credits', "Eclipse (Estonian Bambi's Part)\n\nSong by Pyxlmated\n\nOpponent Sprites by @mrlambilol (YT)\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
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
	doTweenAlpha('fadeOut', 'flash', 0, 15.35, 'linear')
	doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
end

function onStepHit()
	if curStep == 448 then
		doTweenY('creditTween', 'Credits', -360, 2, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 2, 'linear')
	end
	if curStep == 896 then
		doTweenAlpha('in', 'flash', 1, 3.8, 'linear')
	end
	if curStep == 1016 then
		doTweenAlpha('out', 'flash', 0, 0.2, 'linear')
	end
	if curStep == 7680 then
		doTweenAlpha('Byebye', 'flash', 1, 15.35, 'linear')
	end
end