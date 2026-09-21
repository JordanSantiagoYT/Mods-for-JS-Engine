function onCreatePost()
    	makeLuaSprite('bg', 'NoiseMedium', -400, -600);
    	addLuaSprite('bg');
    	scaleObject('bg', 8, 8);
	setScrollFactor('bg', 0.1, 0.1)
	initLuaShader("BlueLava")
	setSpriteShader("bg", "BlueLava")

	makeLuaSprite('front','oppo/ThanosGround',600,750)
	setProperty('front.color', getColorFromHex('34bdeb'))
	addLuaSprite('front',false)
	scaleObject('front', 0.3, 0.3)
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/1000)
end