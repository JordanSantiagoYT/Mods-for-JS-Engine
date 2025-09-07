function onCreate()
        makeLuaSprite('bg', 'white', -950, -550);
        scaleObject('bg', 2, 2);
        setLuaSpriteScrollFactor('bg', 0.4, 0.4);
        addLuaSprite('bg', false);

	makeLuaSprite('oppSprite', 'billy', -300, 300);
	scaleObject('oppSprite', 1, 1);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);

        initLuaShader("greenBG")
        setSpriteShader("bg", "greenBG")
end

function onUpdate(elapsed)
        setShaderFloat('bg', 'iTime', getSongPosition() / 500)
end