function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "The Prophecy (Dan's Section)\n\nComposed by cakeman\n\nChart by Jordan Santiago\n\nOpponent Sprites by Xaura404", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 36)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

    	makeLuaSprite('Dan', 'Dan', -1500,-1000)
    	setLuaSpriteScrollFactor('Dan', 1.4, 1.4);
   	addLuaSprite('Dan')
	scaleObject('Dan', 1.7,1.8);
    	setScrollFactor('Dan', 0, 0);
    	addGlitchEffect('Dan', 12.5, 150)

	setProperty('dad.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('Dan.alpha', 0)
	setProperty('camZoomingDecay', 2.5)
	setProperty('camZooming', true)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 28, 'linear')
end
function onStepHit()
	if curStep == 1024 then
		setProperty('flash.alpha', 0)
		setProperty('dad.alpha', 1)
		setProperty('iconP2.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, (480/curBpm), 'expoOut')
	end
	if curStep == 1152 then
		doTweenY('creditTween', 'Credits', -480, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 2560 then
		setProperty('flash.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 2816 or curStep == 8960 or curStep == 12032 then
		setProperty('flash.alpha', 0)
		setProperty('Dan.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 3840 or curStep == 9984 then
		setProperty('Dan.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 8448 then
		doTweenAlpha('byesong', 'flash', 1, (240/curBpm) * 28)
	end
	if curStep == 12544 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 32, 'linear')
	end
	if curStep == 13152 then
		setProperty('Dan.alpha', 0)
	end
end

function onEvent(n,v1,v2)
	if n == 'Change Character' and v2 == 'dan-nullified' then
		setProperty('dad.singDuration', 8)
		setProperty('dad.x', 0)
		setProperty('dad.y', 440)
	end
	if n == 'Change Character' and v2 == 'bf' then
		setProperty('boyfriend.singDuration', 8)
	end
end