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
	]])
end

function onUpdate(elapsed)
	amount = (getSongPosition() / 1000) / (240 / curBpm) * 360 % 360
    	setShaderFloat("adjustColor",'hue', amount)
end