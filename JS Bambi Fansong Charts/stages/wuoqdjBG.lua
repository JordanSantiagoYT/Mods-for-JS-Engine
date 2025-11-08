function onCreatePost()
    	makeLuaSprite('bg', 'nothing', -1300, -400);
    	addLuaSprite('bg');
    	scaleObject('bg', 3, 3);
	initLuaShader("arqVoid")
	setSpriteShader("bg", "arqVoid")

	makeLuaSprite('oppSprite', 'Wuoqdj', -200, 200);
	scaleObject('oppSprite', 1, 1);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/400)
end