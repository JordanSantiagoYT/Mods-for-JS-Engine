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
	setProperty('hue.x',getProperty('hue.x')+hueAdd)
	amount = getProperty('hue.x')

	if curStep >= 896 and curStep <= 1408 then
    		setShaderFloat("adjustColor",'hue', amount)
	elseif curStep >= 1920 and curStep <= 2176 then
		hueAdd = 4
    		setShaderFloat("adjustColor",'hue', amount)
	elseif curStep >= 2176 and curStep <= 2432 then
		hueAdd = 6
    		setShaderFloat("adjustColor",'hue', amount)
	else setShaderFloat("adjustColor",'hue', 0)
	end
end