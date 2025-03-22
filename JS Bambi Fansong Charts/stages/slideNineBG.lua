function onCreate()
	-- background shit
	makeLuaSprite('slide9', 'slide9', -3490, -1800);
	setLuaSpriteScrollFactor('slide9', 0.4, 0.4);
	addGlitchEffect('slide9', 2,5,0.1)
	
        scaleObject('slide9', 4.6, 4.6);

	addLuaSprite('slide9', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end