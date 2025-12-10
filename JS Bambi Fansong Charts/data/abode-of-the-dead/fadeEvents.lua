function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaSprite('MetalPipe', 'metalpipe', 0, 0);
	addLuaSprite('MetalPipe', true);
	setLuaSpriteScrollFactor('MetalPipe', 0, 0)
	scaleObject('MetalPipe', 0.44, 0.44)
	setProperty('MetalPipe.alpha', 0)
	setObjectCamera('MetalPipe', 'camOther')

	makeLuaText('Credits', "Abode of the Dead\n\nSong by Null_y34r\n\nChart by Jordan Santiago\n\nOpponent Sprites by thebambob", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('dad.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flashOut', 'flash', 0, (240/curBpm) * 64, 'linear')
end

function onStepHit()
	if curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('dad.alpha', 1)
		doTweenY('creditTween', 'Credits', 270, (480/curBpm), 'expoOut')
	end
	if curStep == 1152 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 2032 or curStep == 3568 then
		doTweenAlpha('fade1', 'flash', 1, (240/curBpm), 'linear')
	end
	if curStep == 2048 then
		doTweenAlpha('fade2', 'flash', 0, (240/curBpm) * 4, 'linear')
	end
	if curStep == 3584 then
		doTweenAlpha('fade3', 'flash', 0, (240/curBpm) * 2, 'linear')
	end
	if curStep == 3936 then
		setProperty('MetalPipe.alpha', 1)
	end
	if curStep == 3944 then
		setProperty('MetalPipe.alpha', 0)
	end
	if curStep == 6144 then
		cameraFlash('camOther', 'ffffff', 0.7)
		addBloomEffect('camHUD', 0.25)
		addBloomEffect('camGame', 0.25)
	end
	if curStep == 7168 then
		cameraFlash('camOther', 'ffffff', 0.7)
		clearEffects('camHUD')
		clearEffects('camGame')
		setProperty('dad.alpha', 0)
	end
	if curStep == 7424 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 16, 'linear')
	end
end