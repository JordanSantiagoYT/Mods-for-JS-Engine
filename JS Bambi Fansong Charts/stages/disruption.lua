function onCreate()
	-- background shit
	makeLuaSprite('disruptor', 'disruptor', -400, -200);
	setLuaSpriteScrollFactor('disruptor', 0, 0);
	scaleObject('disruptor', 1, 1)
	addGlitchEffect('disruptor', 2, 5, 0.1)
	addLuaSprite('disruptor', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end