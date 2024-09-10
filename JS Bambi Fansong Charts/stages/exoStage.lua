function onCreate()
	-- background shit
	makeLuaSprite('back', 'exoBG/ExoBG', -1000, -600);
	setScrollFactor('back', 0.5, 0.5);
	scaleObject('back', 3, 3)
	addGlitchEffect('back', 2, 5, 0.1)
	
	makeLuaSprite('front', 'exoBG/ExoPlatform', 750, 750);
	setScrollFactor('front', 1, 1);
	scaleObject('front', 1, 1);
	setProperty('front.color', getColorFromHex('D0A8FF'))

	addLuaSprite('back', false)
	addLuaSprite('front', false)

	close(true);
end