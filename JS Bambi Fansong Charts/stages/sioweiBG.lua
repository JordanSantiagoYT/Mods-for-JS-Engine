function onCreate()
	makeLuaSprite('bg', 'siowei/bg', -1400, -420);
	scaleObject('bg', 1.5, 1.5);
   	setScrollFactor('bg', 1, 1);
	addLuaSprite('bg', false);

	makeLuaSprite('oppSprite', 'siowei/siowei-frokeni', -500, -100);
	scaleObject('oppSprite', 0.5, 0.5);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);

	makeLuaSprite('oppSprite2', 'siowei/siowei REAL', -500, -100);
	scaleObject('oppSprite2', 0.5, 0.5);
    	setScrollFactor('oppSprite2', 1, 1);
	addLuaSprite('oppSprite2', false);
	setProperty('oppSprite2.alpha', 0)
end