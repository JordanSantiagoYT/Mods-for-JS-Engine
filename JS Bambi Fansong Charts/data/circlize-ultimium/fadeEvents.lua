function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
	setProperty('PlayState.SONG.songCredit', '')

	makeLuaText('Credits', "Circlize Ultimium\n\nSong by Integralli\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 64, 'linear')
end
function onStepHit()
	if curStep == 1024 then
		doTweenY('creditTween', 'Credits', 250, (960/curBpm), 'expoOut')
	end
	if curStep == 1280 then
		doTweenY('creditTween', 'Credits', -420, (960/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (960/curBpm), 'linear')
	end
	if curStep == 5376 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 16, 'linear')
	end
end