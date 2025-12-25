function onCreate()

	makeAnimatedLuaSprite('bg', 'TechCond/bg', -1800, -550);
	addAnimationByPrefix('bg', 'idle', 'idle', 30, true)
	setScrollFactor('bg', 0.9, 0.9);
	scaleObject('bg', 3,3)
	setProperty('bg.alpha', 1)
	addLuaSprite('bg', false);

	makeLuaSprite('oppSprite', 'TechCond/opp', -1400, -100);
	scaleObject('oppSprite', 1, 1);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
	setProperty('oppSprite.alpha', 0)

	close(true);
end