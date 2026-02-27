function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Crying Kaomoji Remake (Null Version)\n\nSong by Null_y34r\n\nChart by Jordan Santiago\n\nOpponent Sprites by TheTrueAccount_2\n\nBF Sprites by DiegoT", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 32, 'linear')
end
function onStepHit()
	if curStep == 512 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 220, (240/curBpm), 'expoOut')
	end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', -480, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 3456 then
		doTweenAlpha('fadeIn1', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
end