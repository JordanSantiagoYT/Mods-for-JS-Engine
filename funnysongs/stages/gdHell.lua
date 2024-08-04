function onCreate()
	makeLuaSprite('hellDash', 'hellometryDash', -3400, -2400);
	setLuaSpriteScrollFactor('hellDash', 1, 1);
	scaleObject('hellDash', 7, 7)
	addGlitchEffect('hellDash',2,6,0.1)
	addLuaSprite('hellDash', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end