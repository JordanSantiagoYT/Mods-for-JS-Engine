function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Competitive Piss Drinker\n\nSong by TimeLaserz\n\nChart by Jordan Santiago\n\nInspired by 'Analog horror be like' by Dumbbass-l3e", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaSprite('oppSprite', 'pissdrinker/char', 100, 460);
	scaleObject('oppSprite', 1, 1);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);

	setProperty('healthBarBG.visible', true)
	setProperty('healthBar.visible', true)
	setProperty('iconP1.visible', true)
	setProperty('iconP2.visible', true)
	
	addVCREffect('camHUD')
	addVCREffect('camGame')
	addGreyscaleEffect('camHUD')
	addGreyscaleEffect('camGame')
	addChromaticAbberationEffect('camHUD', 0.002)
	addChromaticAbberationEffect('camGame', 0.001)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	doTweenAlpha('flTw', 'flash', 0, 14, 'linear')
end

function onStepHit()
	if curStep == 112 then
		doTweenY('creditTween', 'Credits', -360, 1.4, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.4, 'linear')
	end
	if curStep == 496 or curStep == 1264 then
		doTweenAlpha('fadeIn1', 'flash', 0.9, 0.75, 'linear')
	end
	if curStep == 504 or curStep == 1272 then
		doTweenAlpha('fadeIn1', 'flash', 0, 0.6, 'expoIn')
	end
	if curStep == 1856 then
		doTweenAlpha('fadeIn', 'flash', 1, 17.6, 'linear')
	end
end