function onCreate()
	makeLuaSprite('BG4', 'endoftheworld/12141bruhhh', -2500, -700);
	setScrollFactor('BG4', 0.9, 0.9);
	scaleObject('BG4', 4,4)
	addGlitchEffect('BG4', 2, 2, 0.1); 

	makeAnimatedLuaSprite('GIF', 'endoftheworld/sex', -2000, -1250);
	addAnimationByPrefix('GIF', 'sex', 'original (1)_gif', 30, true)
	setScrollFactor('GIF', 0.9, 0.9);
	scaleObject('GIF', 8,8)
	setProperty('GIF.alpha', 0)

	addLuaSprite('BG4', false);
	addLuaSprite('GIF', false);

	makeLuaSprite('edolando', 'endoftheworld/edolando', -200, 750);
	scaleObject('edolando', 1, 1)
	addLuaSprite('edolando', false);

	doTweenAlpha('4Alpha4', 'BG4', 0.38, 0.0001, "lineal")
	close(true);
end