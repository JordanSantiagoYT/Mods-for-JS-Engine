function onCreate()
	makeLuaSprite('gris', 'gris', -2800, -1700);
	setScrollFactor('gris', 0.9, 0.9);
	scaleObject('gris', 8, 8)

	addLuaSprite('gris', false);
	addGlitchEffect('gris', 2, 5, 0.1); 
	close(true);
end