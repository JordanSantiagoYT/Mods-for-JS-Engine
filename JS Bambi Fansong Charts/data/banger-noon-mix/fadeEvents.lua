function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

    	makeLuaSprite("temporaryShader")
    	makeGraphic("temporaryShader", screenWidth, screenHeight)

	initLuaShader("pixelation")
    
    	setSpriteShader("temporaryShader", "pixelation")

    	addHaxeLibrary("ShaderFilter", "openfl.filters")
	setShaderFloat("temporaryShader", "pixelSize", 0.0)

	runHaxeCode([[
      		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
      	 	game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
   	]])

	makeLuaSprite('pixels', '', 0, 0);
	setProperty('pixels.visible',false)
  	addLuaSprite('pixels',false);

	makeLuaText('Credits', "Banger (Noon Mix)\n\nSong by abstractnebula\n\nChart by Jordan Santiago\n\nOpp Sprites by Enzo Polis\n\nBF Sprites from Super Funkin' Galaxy", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 32)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 4, 'linear')
end
function onStepHit()
	if curStep == 128 then
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 176 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1144 then
		pixelEnabled = true
		doTweenX('pixelIn', 'pixels', 10, (120/curBpm), 'linear')
	end
	if curStep == 1216 then
		doTweenX('pixelOut', 'pixels', 0, (240/curBpm) * 8, 'linear')
	end
	if curStep == 1408 then
		pixelEnabled = false
	end
	if curStep == 1664 then
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 1)
	end
	if curStep == 1680 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setObjectCamera('flash', 'camOther')
		setProperty('flash.alpha', 0)
	end
	if curStep == 2368 then
		pixelEnabled = true
		doTweenX('pixelInAgain', 'pixels', 10, (240/curBpm) * 6, 'linear')
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 6, 'linear')
	end
	if curStep == 2464 then
		pixelEnabled = false
		setProperty('pixels.x', 0)
		setShaderFloat("temporaryShader", "pixelSize", 0.0)
	end
end

pixelEnabled = false
function onUpdate(elapsed)
	if not pixelEnabled then return end

	pixelation = getProperty('pixels.x')
	if pixelation > 0 then
		setShaderFloat("temporaryShader", "pixelSize", pixelation)
	end
end