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

hueSpeed = 0
coolPart = false
function onUpdate(elapsed)
	amount = (getSongPosition() / 1000) / (1920 / curBpm) * 360 % 360

	if coolPart then
    		setShaderFloat("adjustColor",'hue', amount)
	else setShaderFloat("adjustColor",'hue', 0)
	end
end

function onStepHit()
	if curStep == 1280 then coolPart = true end
	if curStep == 2048 then coolPart = false end
end