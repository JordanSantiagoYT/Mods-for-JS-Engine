function onCreate()
	makeLuaSprite('macabre', 'macabre', -1600, -900);
	setLuaSpriteScrollFactor('macabre', 0, 0);
	scaleObject('macabre', 3.5, 3.5);
	addLuaSprite('macabre', false)

	initLuaShader("macabre")
	setSpriteShader("macabre", "macabre")
end

function onUpdate(elapsed)
	setShaderFloat('macabre', 'iTime', getSongPosition()/800)
end