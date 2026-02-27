function onCreatePost()

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Goodbye\n\nSong by Monroe14\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 7, 'linear')
end
function onStepHit()
	if curStep == 112 then
		noteTweenX('bfStrumX', 4, 1400, 0.8, 'quartInOut')
		noteTweenX('bfStrumX1', 5, 1400, 0.9, 'quartInOut')
		noteTweenX('bfStrumX2', 6, 1400, 1.0, 'quartInOut')
		noteTweenX('bfStrumX3', 7, 1400, 1.1, 'quartInOut')
		noteTweenX('oppStrumX0', 0, 415, 1.8, 'quartInOut')
		noteTweenX('oppStrumX1', 1, 525, 1.8, 'quartInOut')
		noteTweenX('oppStrumX2', 2, 635, 1.8, 'quartInOut')
		noteTweenX('oppStrumX3', 3, 745, 1.8, 'quartInOut')
	end
	if curStep == 128 then
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 160 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1344 then
		doTweenAlpha('fadeIn1', 'flash', 1, (480/curBpm) * 2, 'linear')
	end
end