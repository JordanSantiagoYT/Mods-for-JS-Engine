function onCreate()
	makeLuaSprite('bg', 'wAbyssBG/stage', -2050, -1230);
	scaleObject('bg', 2.2, 2.2);
   	setScrollFactor('bg', 0, 0);
	addLuaSprite('bg', false);

	makeLuaSprite('oppSprite', 'wAbyssBG/opponent', -640, -1420);
	scaleObject('oppSprite', 1.1, 1.1);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);

	makeLuaSprite('logo', 'wAbyssBG/logo', -540, -800);
	scaleObject('logo', 3, 3);
    	setScrollFactor('logo', 1, 1);
	addLuaSprite('logo', false);
end