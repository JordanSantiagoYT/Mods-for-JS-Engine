function onCreatePost()
	makeLuaSprite('bg', 'forlornBG', -700, -300);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 1.2, 1.2)
	addGlitchEffect('bg', 2, 5, 0.1)
	addLuaSprite('bg', false);
end