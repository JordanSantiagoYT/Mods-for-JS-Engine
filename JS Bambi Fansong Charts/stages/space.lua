function onCreate()     
	
	makeLuaSprite('space', '2024_09_06_0uo_Kleki', -1400, -600);
	setScrollFactor('space', 0.9, 0.9);

	addLuaSprite('space', false);
	scaleLuaSprite('space',2.7,2.7);
	setScrollFactor('space', 0, 0);
	addGlitchEffect('space', 1, 4)
end
