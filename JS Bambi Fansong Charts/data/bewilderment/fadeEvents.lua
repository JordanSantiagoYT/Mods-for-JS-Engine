function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Bewilderment but the spam was amplified\n\nSong by Null_y34r\n\nChart by Jordan Santiago\n\nSprites by atpengineer2002 (YT)", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 31, 'linear')
end
function onStepHit()
	if curStep == 512 then
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, 1.6, 'expoOut')
	end
	if curStep == 608 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 6912 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 16, 'linear')
	end
end