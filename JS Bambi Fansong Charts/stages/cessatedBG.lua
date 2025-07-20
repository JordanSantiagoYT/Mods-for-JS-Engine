function onCreate()
	makeLuaSprite('bg', 'cessated/bg', -2200, -1100);
	setScrollFactor('bg', 0.6, 0.6);
	scaleObject('bg', 2, 2);
	addLuaSprite('bg', false)
	addGlitchEffect('bg', 2, 5, 0.1);

	makeLuaSprite('fg', 'cessated/fg', -1000, -500);
	scaleObject('fg', 3, 3);
   	setScrollFactor('fg', 0.3, 0.3);
	addLuaSprite('fg', false);
end