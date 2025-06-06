function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Fallguysophobia\n\nSong by TrexFNF\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 14, 'linear')
end

function onStepHit()
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 992 or curStep == 2016 then
		doTweenAlpha('flashThing', 'flash', 0.9, 0.99, 'linear')
	end
	if curStep == 1008 or curStep == 2032 then
		doTweenAlpha('flashThing', 'flash', 0, 0.99, 'linear')
	end
	if curStep == 2624 then
		doTweenAlpha('okBye', 'flash', 1, 11.4, 'linear')
	end
	if curStep == 2812 then
		doTweenAlpha('okBye', 'flash', 0, 0.2, 'linear')
	end
end