function onCreatePost()
	makeLuaSprite('sunset','sky_sunset',-680,-130)
	addLuaSprite('sunset',false)
	setLuaSpriteScrollFactor('sunset', 0.1, 0.1)
	setProperty('sunset.alpha', 0)
	setObjectOrder('sunset', 1)

	makeLuaSprite('night','bambiBG/night',-680,-130)
	addLuaSprite('night',false)
	setLuaSpriteScrollFactor('night', 0.1, 0.1)
	setObjectOrder('night', 2)
	setProperty('night.alpha', 0)

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', 'Maze (Stinko Remix)\n\nCharter: Jordan Santiago\n\nComposer: StinkoTheStupido\n\nOriginal Composer: MoldyGH\n\nAssets from D&B 3.0', 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setProperty('ytWatermark.alpha', 0)

	doTweenAlpha('bg', 'theBg', '0', 53.09, 'linear')
	doTweenAlpha('bg1', 'sunset', '1', 53.09, 'linear')
	tweenColors('0xffff8fb2')
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 260, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 13.7, 'linear')
end

function onStepHit()
	if curStep == 118 then
		doTweenY('creditTween', 'Credits', -420, 1.4, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.4, 'linear')
	end
	if curStep == 400 then
		tweenColors('0xff878787')
		doTweenAlpha('byeSunset', 'sunset', '0', 53.09, 'linear')
		doTweenAlpha('nightIn', 'night', '1', 53.09, 'linear')
	end
	if curStep == 400 or curStep == 528 or curStep == 1192 or curStep == 1256 or curStep == 1320 or curStep == 1576 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
	end
end

function tweenColors(color)
	doTweenColor('MoldyGH', 'grasshill', color, 53.09, 'linear')
	doTweenColor('h', 'hills', color, 53.09, 'linear')
	doTweenColor('f', 'farm', color, 53.09, 'linear')
	doTweenColor('grpun', 'ground', color, 53.09, 'linear')
	doTweenColor('c1', 'corn1', color, 53.09, 'linear')
	doTweenColor('c2', 'corn2', color, 53.09, 'linear')
	doTweenColor('cb', 'thecornbag', color, 53.09, 'linear')
	doTweenColor('ctsign', 'sign', color, 53.09, 'linear')
   	doTweenColor('boyfriendColorTween', 'boyfriend', color, 53.09, 'linear')
    	doTweenColor('dadColorTween', 'dad', color, 53.09, 'linear')
    	doTweenColor('gfColorTween', 'gf',color, 53.09, 'linear')
end