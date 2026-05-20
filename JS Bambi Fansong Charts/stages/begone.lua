function onCreate()
	makeLuaSprite('bg', nil, -2600, -1500)
	makeGraphic('bg', 6450, 3700)
	setScrollFactor('bg', 0, 0)
	addLuaSprite('bg', false)
	initLuaShader("begone")
	setSpriteShader("bg", "begone")

	makeLuaSprite('begone', 'begone', 900, 480);
	setLuaSpriteScrollFactor('begone', 1, 1);
	scaleObject('begone', 2, 2);
	setProperty('begone.angle', 10)
	addLuaSprite('begone', false);
end
function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/800)
end