function onCreate()
	makeLuaSprite('bg', 'gloomy/BG', -1000, -300);
	scaleObject('bg', 2, 1);
   	setScrollFactor('bg', 1, 1);
	addLuaSprite('bg', false);
	addGrayscaleEffect('bg')

	makeLuaSprite('oppSprite', 'gloomy/indonesia guy', -100, 0);
	scaleObject('oppSprite', 1.5, 1.5);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
end