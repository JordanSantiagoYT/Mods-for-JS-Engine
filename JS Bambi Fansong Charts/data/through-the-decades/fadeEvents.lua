function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Through the Decades\n\nSong by 18hera\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	runTimer("camOff", 0) --If you're using the camera note movement script by An Ammar, this fixes the camera focusing on the opponent when it should REALLY focus on bf!
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 2, 'linear')
	runTimer("camOn", (240/curBpm)) --NOW camera can move!
end
function onStepHit()
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 288 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1786 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('flashIn', 'flash', 1, (60/curBpm))
	end
	if curStep == 1808 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setObjectCamera('flash', 'camOther')
	end
	if curStep == 2640 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 20, 'linear')
	end
end