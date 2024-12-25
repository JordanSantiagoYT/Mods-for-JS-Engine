function onCreatePost()
	makeLuaText('Credits', 'Polygonized (Stinko Remix)\n\nCharter: Jordan Santiago\n\nComposer: StinkoTheStupido\n\nOriginal Composer: MoldyGH\n\nAssets from D&B 3.0', 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setProperty('ytWatermark.alpha', 0)

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camHUD')

	makeLuaSprite('blackBG', '', 0, 0);
	makeGraphic('blackBG', 1280, 720, '000000')
	addLuaSprite('blackBG', true);
	setLuaSpriteScrollFactor('blackBG', 0, 0)
	setProperty('blackBG.scale.x', 2)
	setProperty('blackBG.scale.y', 2)
	setProperty('blackBG.alpha', 0)
	setObjectCamera('blackBG', 'camGame')
	setObjectOrder('blackBG', 9)
end

function onSongStart()
	doTweenY('creditTween', 'Credits', 240, 1.3, 'expoOut')
end

function onStepHit()
	if curStep == 112 then
		doTweenY('creditTween', 'Credits', -360, 1.3, 'expoIn')
		doTweenAlpha('fadeOut', 'flash', 0, 1.3, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.3, 'expoIn')
	end
	if curStep == 128 then
		cameraFlash('camOther', 'ffffff', 1)
	end
	if curStep == 640 or curStep == 1152 then
		noteTweenX('oppStrumX0', 0, 415, 1.3, 'expoOut')
		noteTweenX('oppStrumX1', 1, 525, 1.4, 'expoOut')
		noteTweenX('oppStrumX2', 2, 635, 1.5, 'expoOut')
		noteTweenX('oppStrumX3', 3, 745, 1.6, 'expoOut')
		noteTweenX('bfStrumX', 4, 1400, 0.8, 'quartInOut')
		noteTweenX('bfStrumX1', 5, 1400, 0.9, 'quartInOut')
		noteTweenX('bfStrumX2', 6, 1400, 1.0, 'quartInOut')
		noteTweenX('bfStrumX3', 7, 1400, 1.1, 'quartInOut')
	end
	if curStep == 696 or curStep == 760 or curStep == 1272 or curStep == 2432 then
		noteTweenX('oppStrumBack0', 0, defaultOpponentStrumX0, 0.6, 'expoOut')
		noteTweenX('oppStrumBack1', 1, defaultOpponentStrumX1, 0.6, 'expoOut')
		noteTweenX('oppStrumBack2', 2, defaultOpponentStrumX2, 0.6, 'expoOut')
		noteTweenX('oppStrumBack3', 3, defaultOpponentStrumX3, 0.6, 'expoOut')
		noteTweenX('bfStrumBack0', 4, defaultPlayerStrumX0, 0.6, 'expoOut')
		noteTweenX('bfStrumBack1', 5, defaultPlayerStrumX1, 0.6, 'expoOut')
		noteTweenX('bfStrumBack2', 6, defaultPlayerStrumX2, 0.6, 'expoOut')
		noteTweenX('bfStrumBack3', 7, defaultPlayerStrumX3, 0.6, 'expoOut')
	end
	if curStep == 704 then
		noteTweenX('opp0', 0, -200, 0.8, 'quartInOut')
		noteTweenX('opp1', 1, -200, 0.9, 'quartInOut')
		noteTweenX('opp2', 2, -200, 1.0, 'quartInOut')
		noteTweenX('opp3', 3, -200, 1.1, 'quartInOut')
		noteTweenX('bfStrumX', 4, 415, 1.3, 'expoOut')
		noteTweenX('bfStrumX1', 5, 525, 1.4, 'expoOut')
		noteTweenX('bfStrumX2', 6, 635, 1.5, 'expoOut')
		noteTweenX('bfStrumX3', 7, 745, 1.6, 'expoOut')
	end
	if curStep == 1024 or curStep == 1152 or curStep == 1312 or curStep == 1408 then
		cameraFlash('camHUD', 'ffffff', 0.5)
	end
	if curStep == 2176 then
		doTweenAlpha('hideBehindBF', 'blackBG', 1, 10.67, 'linear')
		noteTweenX('opp0', 0, -200, 0.9, 'quartInOut')
		noteTweenX('opp1', 1, -200, 1.0, 'quartInOut')
		noteTweenX('opp2', 2, -200, 1.1, 'quartInOut')
		noteTweenX('opp3', 3, -200, 1.2, 'quartInOut')
		noteTweenX('bfStrumX', 4, 415, 1.3, 'quartInOut')
		noteTweenX('bfStrumX1', 5, 525, 1.4, 'quartInOut')
		noteTweenX('bfStrumX2', 6, 635, 1.5, 'quartInOut')
		noteTweenX('bfStrumX3', 7, 745, 1.6, 'quartInOut')
	end
	if curStep == 2304 then
		cameraFade('camGame', 'ffffff', 10.66)
	end
	if curStep == 2432 then
		cameraFade('camGame', 'ffffff', 1, false, true)
		setProperty('redBG.alpha', 0)
		setProperty('blackBG.alpha', 0)
    		doTweenColor('boyfriendColorTween', 'boyfriend', '0xff878787', 0.01, 'quadInOut')
    		doTweenColor('dadColorTween', 'dad', '0xff878787', 0.01, 'quadInOut')
    		doTweenColor('gfColorTween', 'gf','0xff878787', 0.01, 'quadInOut')
		setProperty('boyfriend.heyTimer', 13)
		characterPlayAnim('boyfriend', 'hey', true);
		setProperty('boyfriend.specialAnim', true)
		setProperty('gf.heyTimer', 13)
		characterPlayAnim('gf', 'cheer', true);
		setProperty('gf.specialAnim', true)
	end
	if curStep == 2496 then
		doTweenAlpha('fadeOut', 'flash', 1, 7.66, 'linear')
	end
end