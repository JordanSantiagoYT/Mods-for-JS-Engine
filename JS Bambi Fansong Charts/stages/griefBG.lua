function onCreate()
	makeLuaSprite('bg', 'griefer/bg', -1500, -800);
	scaleObject('bg', 3, 3);
   	setScrollFactor('bg', 1, 1);
	addLuaSprite('bg', false);
	addGlitchEffect('bg', 2, 5, 0.1)

	makeLuaSprite('oppSprite', 'griefer/steve', 150, -100);
	scaleObject('oppSprite', 2.5, 2.5);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
end