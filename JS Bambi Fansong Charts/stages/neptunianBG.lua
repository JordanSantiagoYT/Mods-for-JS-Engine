function onCreate()
	makeLuaSprite('bg', 'NeptunianBG', -2050, -1230);
	scaleObject('bg', 2.2, 2.2);
   	setScrollFactor('bg', 0, 0);
	addLuaSprite('bg', false);
	addWiggleEffect('bg', 'heat wave vertical');

	makeLuaSprite('oppSprite', 'NeptunianMan', -1750, -1930);
	scaleObject('oppSprite', 0.8, 0.8);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
end