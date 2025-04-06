function onCreate()
	makeLuaSprite('bg', 'neptuneV2/BG', -2050, -1230);
	scaleObject('bg', 2.2, 2.2);
   	setScrollFactor('bg', 0, 0);
	addLuaSprite('bg', false);
	addGlitchEffect('bg', 2, 5, 0.1);

	makeLuaSprite('oppSprite', 'neptuneV2/man', -850, -1080);
	scaleObject('oppSprite', 1.2, 1.2);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);

	makeLuaSprite('plat', 'neptuneV2/ThePlat', -130, 650);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 1.1, 1.1);
	addLuaSprite('plat', false)
end