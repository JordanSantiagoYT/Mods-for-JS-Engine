function onCreatePost()
    	makeLuaSprite('bg', 'phonoBG', -1200, -600);
    	addLuaSprite('bg');
	scaleObject('bg', 4, 4)
    	addGlitchEffect('bg', 2, 5, 0.1);
	setLuaSpriteScrollFactor('bg', 0, 0)
end