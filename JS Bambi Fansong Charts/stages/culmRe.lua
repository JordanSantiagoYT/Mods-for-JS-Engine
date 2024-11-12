function onCreatePost()
    	makeLuaSprite('red', 'reddishLol', -1900, -1000);
	scaleObject('red', 2, 2);
   	addLuaSprite('red');
    	addGlitchEffect('red', 2, 2, 0.2);
	setLuaSpriteScrollFactor('red', 0, 0)

	initLuaShader('BlackAndRed');
	setSpriteShader('boyfriend', 'BlackAndRed');
	setShaderBool('boyfriend', 'invert', true)
end