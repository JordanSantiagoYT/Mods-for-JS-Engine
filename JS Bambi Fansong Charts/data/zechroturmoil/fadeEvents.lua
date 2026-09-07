function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Zechroturmoil\n\nSong by JX256\n\nChart by Jordan Santiago\n\nOpponent Sprites by Xaura404\n\nBackground from Hortas Edition V3", 1250, 0, 740)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 32)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 2, 'expoIn')
end
function onStepHit()
	if curStep == 32 then
		doTweenY('creditTween', 'Credits', 200, (240/curBpm), 'expoOut')
	end
	if curStep == 80 then
		doTweenY('creditTween', 'Credits', -480, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 793 then
		doTweenAlpha('fadeWhat', 'flash', 1, (90/curBpm), 'quadIn')
	end
	if curStep == 800 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 960 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 6, 'linear')
	end
end