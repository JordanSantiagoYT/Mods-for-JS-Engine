function onCreatePost()
	makeLuaSprite('bg', 'smoky_hill', -600, -500)
	setScrollFactor('bg', 1, 1)
	scaleObject('bg', 0.6, 0.6)
	addLuaSprite('bg', false)

	makeLuaSprite('vig', 'vignette-lessintense', 0, 0);
	addLuaSprite('vig', true);
	setLuaSpriteScrollFactor('vig', 0, 0)
	setProperty('vig.alpha', 1)
	scaleObject('vig', 1/3, 1/3)
	setObjectCamera('vig', 'camHUD')

	triggerEvent('Camera Follow Pos', 500,200)

    	initLuaShader("gray")
    	makeLuaSprite("temporaryShader")
    	makeGraphic("temporaryShader", screenWidth, screenHeight)
    	setSpriteShader("temporaryShader", "gray")
	setShaderFloat('temporaryShader', 'grayIntensity', 0.5)

	runHaxeCode([[
      		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
      	 	game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
   	]])
end