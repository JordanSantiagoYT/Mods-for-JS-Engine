function onCreatePost()
	makeLuaSprite('hue', '', 0, 0);
	setProperty('hue.visible',false)
  	addLuaSprite('hue',false);

	initLuaShader("adjustColor")
	makeLuaSprite("adjustColor")
	makeGraphic("adjustColor", screenWidth, screenHeight)
	setSpriteShader("adjustColor", "adjustColor")

	addHaxeLibrary("ShaderFilter", "openfl.filters")
	runHaxeCode([[
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("adjustColor").shader)]);
		game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("adjustColor").shader)]);
	]])
end

hueAdd = 3
function onUpdate(elapsed)
	hueAdd = crochet / 200
	setProperty('hue.x',getProperty('hue.x')+hueAdd)
	amount = getProperty('hue.x')

	if curStep >= 1024 and curStep <= 1280 or curStep == 2048 and curStep <= 2304 then
    		setShaderFloat("adjustColor",'hue', amount)
	else
		setShaderFloat("adjustColor",'hue', 0)
	end
end