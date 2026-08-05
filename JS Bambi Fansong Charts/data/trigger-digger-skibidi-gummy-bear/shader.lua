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

hueSpeed = 4
function onUpdate(elapsed)
	if curStep < 2784 or curStep > 3888 then return end
	amount = (getSongPosition() / 1000) / (180 / curBpm) / hueSpeed * 360 % 360
    	setShaderFloat("adjustColor",'hue', amount)
end

function onStepHit()
	if curStep == 3120 then
		hueSpeed = 2
	end
	if curStep == 3504 then
		hueSpeed = 1
	end
end