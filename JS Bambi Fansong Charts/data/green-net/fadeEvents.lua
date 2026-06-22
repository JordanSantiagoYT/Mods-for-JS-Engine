function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Green Net\n\nSong by DaniilPoyasov\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 28, 'linear')
end
function onStepHit()
	if curStep == 480 then
		doTweenAlpha('fadeNo', 'flash', 1, (240/curBpm), 'expoOut')
	end
	if curStep == 496 then
		doTweenAlpha('fadeNo1', 'flash', 0, (240/curBpm), 'expoIn')
	end
	if curStep == 512 then
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, (480/curBpm), 'expoOut')
	end
	if curStep == 608 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 5952 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 16, 'linear')
	end
end