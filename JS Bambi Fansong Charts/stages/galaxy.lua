
function onCreate()
	-- background shit
	makeLuaSprite('background', 'galaxy', -1000, -400);
	addLuaSprite('background', false);
	setScrollFactor('background', 0, 0);
	addGlitchEffect('background', 1, 5, 0.1)
	scaleObject('background', 1.4, 1.4);
	close(true);

end