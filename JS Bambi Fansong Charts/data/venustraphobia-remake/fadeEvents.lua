function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Venustraphobia (Remake)\n\nSong by Bomdu\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	setProperty('dad.alpha', 0)
	setProperty('iconP2.alpha', 0)
end

function onSongStart()
	--doTweenAlpha('programmingWarCrime', 'flash', 1, (240/curBpm) * 8, 'linear')
end

function onStepHit()
	if curStep == 128 then
		doTweenAlpha('fadeIn2', 'flash', 0, (240/curBpm) * 8, 'linear')
	end
	if curStep == 240 then
		for _, item in ipairs({'dad', 'iconP2'}) do
       			doTweenAlpha(item..'In', item, 0.3, (240/curBpm) * 0.8, 'linear')
    		end
	end
	if curStep == 256 then
   	     	cameraFlash('camOther', 'ffffff', 0.7)
		addChromaticAbberationEffect('dad', 0.002)
		addChromaticAbberationEffect('iconP2', 0.01)
	     	setProperty('dad.alpha', 1)
	     	setProperty('iconP2.alpha', 1)
		doTweenY('creditTween', 'Credits', 280, (240/curBpm), 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 0.7)
		runHaxeCode('game.dad.shader = null;')
		setProperty('flash.alpha', 1)
		setProperty('boyfriend.alpha', 0)
		for i=0, getProperty('opponentStrums.length') - 1 do
			noteTweenX('strumX'..i, i, 415 + (110 * i), 0.01, 'expoOut')
		end
		for i=0, getProperty('playerStrums.length')-1 do
			noteTweenX('playerStrumBye'..i, i+getProperty('playerStrums.length'), 1400, (10/curBpm), 'linear')
		end
	end
	if curStep == 1040 or curStep == 1167 then
		doTweenAlpha('thing', 'flash', 0, (180/curBpm), 'linear')
		setProperty('cameraSpeed', 100)
	end
	if curStep == 1152 then
		for i=0, getProperty('opponentStrums.length')-1 do
			noteTweenX('oppStrumBye'..i, i, -200, (120/curBpm), 'expoIn')
		end
		doTweenAlpha('byeDad', 'dad', 0, (120/curBpm), 'linear')
	end
	if curStep == 1168 then
   		runHaxeCode([[
	    		game.boyfriend.setColorTransform(0, 0, 0, 1, game.boyfriend.healthColorArray[0], game.boyfriend.healthColorArray[1], game.boyfriend.healthColorArray[2], 0);
    		]]);
		for i=0, getProperty('playerStrums.length')-1 do
			noteTweenX('playerStrumBye'..i, i+getProperty('playerStrums.length'), 415 + (110 * i), 0.01, 'expoOut')
		end
		setProperty('boyfriend.alpha', 1)
		cameraFlash('camHUD', '000000', (120/curBpm))
	end
	if curStep == 1154 or curStep == 1170 then
		setProperty('cameraSpeed', 1)
	end
	if curStep == 1264 then
		cameraFade('camOther', 'ffffff', (230/curBpm), false, false)
	end
	if curStep == 1280 then
		cameraFade('camOther', 'ffffff', (120/curBpm), false, true)
		setProperty('dad.alpha', 1)
		addChromaticAbberationEffect('dad', 0.002)
		noteTweenX('oppStrumBack0', 0, defaultOpponentStrumX0, 0.6, 'expoOut')
		noteTweenX('oppStrumBack1', 1, defaultOpponentStrumX1, 0.6, 'expoOut')
		noteTweenX('oppStrumBack2', 2, defaultOpponentStrumX2, 0.6, 'expoOut')
		noteTweenX('oppStrumBack3', 3, defaultOpponentStrumX3, 0.6, 'expoOut')
		noteTweenX('bfStrumBack0', 4, defaultPlayerStrumX0, 0.6, 'expoOut')
		noteTweenX('bfStrumBack1', 5, defaultPlayerStrumX1, 0.6, 'expoOut')
		noteTweenX('bfStrumBack2', 6, defaultPlayerStrumX2, 0.6, 'expoOut')
		noteTweenX('bfStrumBack3', 7, defaultPlayerStrumX3, 0.6, 'expoOut')
	end
	if curStep == 2048 then
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 2336 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenAlpha('fadeOut', 'flash', 1, 0.01, 'linear')
	end
end