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

	makeLuaText('Credits', "Atelophobia\n\nSong by SuperBlue4119\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('camHUD.alpha', 0.001)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 8, 'linear')
end
function onStepHit()
	if curStep == 256 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fade2', 'flash', 1, (240/curBpm), 'linear')
	end
	if curStep == 288 or curStep == 3367 then
		doTweenAlpha('hiHud', 'camHUD', 1, (240/curBpm), 'linear')
	end
	if curStep == 320 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setObjectCamera('flash', 'camHUD')
		setObjectOrder('flash', 0)
		doTweenY('creditTween', 'Credits', 250, (480/curBpm), 'expoOut')
	end
	if curStep == 384 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'expoIn')
	end
	if curStep == 960 then
		doTweenAlpha('fade2', 'flash', 1, (240/curBpm), 'linear')
	end
	if curStep == 1024 or curStep == 3392 or curStep == 4416 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 3072 then
		setObjectCamera('flash', 'camOther')
		doTweenAlpha('fade3', 'flash', 1, (240/curBpm), 'linear')
		doTweenAlpha('byeHud', 'camHUD', 0, (240/curBpm), 'linear')
	end
	if curStep == 3152 then
		doTweenAlpha('fadeOut2', 'flash', 0, (240/curBpm) * 7, expoOut, 'linear')
	end
	if curStep == 3264 then
		cameraFlash('camOther', 'ffffff', 0.2)
	end
	if curStep == 4400 then
		setProperty('flash.alpha', 1)
	end
	if curStep == 4928 then
		doTweenAlpha('fadeOutFinal', 'flash', 1, (240/curBpm) * 2, linear, 'linear')
	end
end