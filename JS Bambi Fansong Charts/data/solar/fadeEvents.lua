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
	setShaderFloat("temporaryShader", "pixelSize", 6.0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 22, 'linear')
end

function onStepHit()
	if curStep == 768 then
		cameraFlash('camOther', 'ffffff', 0.7)
		runHaxeCode([[
      			game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
      	 		game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
   		]])
	end
	if curStep == 1280 then
		cameraFlash('camOther', 'ffffff', 0.7)
		clearEffects('camHUD')
		clearEffects('camGame')
	end
	if curStep == 1920 then
		doTweenAlpha('okBye', 'flash', 1, 12.7, 'linear')
	end
end