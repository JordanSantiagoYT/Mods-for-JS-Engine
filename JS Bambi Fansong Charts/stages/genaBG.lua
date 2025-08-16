function onCreate()
	makeLuaSprite('bg', 'gena/BG', -1000, -480);
	scaleObject('bg', 1, 1);
   	setScrollFactor('bg', 1, 1);
	addLuaSprite('bg', false);

	makeLuaSprite('oppSprite', 'gena/gena', -100, 200);
	scaleObject('oppSprite', 1.4, 1.4);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
end