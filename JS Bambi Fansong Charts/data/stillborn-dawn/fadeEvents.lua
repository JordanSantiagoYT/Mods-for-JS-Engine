function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Stillborn Dawn\n\nSong by compl.x\n\nChart by Jordan Santiago\n\nAll Assets by Enzo Polis", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('camZooming', true)
	setProperty('camZoomingDecay', 2)

	makeLuaSprite('hue', '', 0, 0);
	setProperty('hue.visible',false)
  	addLuaSprite('hue',false);
    	setShaderFloat("1",'hue', getProperty('hue.x'))

    	initLuaShader("gray")
    	makeLuaSprite("temporaryShader")
    	makeGraphic("temporaryShader", screenWidth, screenHeight)
    	setSpriteShader("temporaryShader", "gray")
	setShaderFloat('temporaryShader', 'grayIntensity', 1)
end

function onSongStart()
	cameraFlash('camOther', 'ffffff', 0.7)
	doTweenAlpha('fadeIntro', 'flash', 0, 0.01, 'linear')
	for i=0, getProperty('opponentStrums.length') - 1 do
		setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
	end
		noteTweenX('bfStrumX', 4, 415, 0.8, 'quartInOut')
		noteTweenX('bfStrumX1', 5, 525, 0.9, 'quartInOut')
		noteTweenX('bfStrumX2', 6, 635, 1, 'quartInOut')
		noteTweenX('bfStrumX3', 7, 745, 1.1, 'quartInOut')
end
function onStepHit()
	if curStep == 144 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 176 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 400 or curStep == 528 or curStep == 1040 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('hue.x', 0)
		doTweenX('hueIn', 'hue', -360, (240/curBpm) * 8, 'linear')
	end
	if curStep == 656 then
		setProperty('hue.x', 0)
	end
	if curStep == 1294 then
		doTweenAlpha('fadeThing', 'flash', 1, (30/curBpm), 'quartIn')
	end
	if curStep == 1296 then
		runHaxeCode([[
      			game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
      	 		game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
   		]])
		doTweenAlpha('fadeThing2', 'flash', 0, (60/curBpm), 'linear')
	end
	if curStep == 1360 then
		doTweenAlpha('fadeIn1', 'flash', 1, (240/curBpm) * 4, 'linear')
	end
end
function onUpdate(elapsed)
	if getProperty('hue.x') ~= 0 then
    		setShaderFloat("1",'hue', getProperty('hue.x'))
	end
end