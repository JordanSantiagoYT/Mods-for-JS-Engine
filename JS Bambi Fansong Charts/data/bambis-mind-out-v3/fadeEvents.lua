function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Bambi's Mind Out V3\n\nSong by Oskaranosec\n\nChart by Jordan Santiago", 1250, 0, 740)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 36)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm), 'expoOut')
end
function onStepHit()
	if curStep == 320 or curStep == 448 or curStep == 832 or curStep == 960 then
		doTweenAngle('lmao', 'camGame', 360 * 4, (950/curBpm), 'expoIn')
	end
	if curStep == 384 or curStep == 512 or curStep == 896 then
		setProperty('camGame.angle', 0)
	end
	if curStep == 640 then
		doTweenAngle('lmao2', 'boyfriend', 360 * 12, (470/curBpm), 'linear')
	end
	if curStep == 672 or curStep == 1024 then
		setProperty('boyfriend.angle', 0)
	end
	if curStep == 832 then
		doTweenAngle('lmao3', 'dad', 360 * 8, (940/curBpm), 'expoIn')
	end
	if curStep == 896 then
		setProperty('dad.angle', 0)
	end
	if curStep == 960 then
		doTweenAngle('lmao2', 'boyfriend', 360 * 8, (950/curBpm), 'expoIn')
	end
	if curStep == 992 then
		doTweenAlpha('fade1', 'flash', 1, (480/curBpm), 'linear')
	end
	if curStep == 1024 then
		doTweenAlpha('fade2', 'flash', 0.2, (240/curBpm) * 15, 'quadIn')
	end
	if curStep == 1272 then
		doTweenAlpha('fade3', 'flash', 1, (100/curBpm), 'expoOut')
	end
	if curStep == 1280 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 280, (480/curBpm), 'expoOut')
	end
	if curStep == 1364 then
		doTweenY('creditTween', 'Credits', -480, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 2832 then
		setProperty('flash.alpha', 1)
	end
end