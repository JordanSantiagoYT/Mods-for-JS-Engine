function onCreate()
	-- background shit
	makeLuaSprite('Seizuretastic', 'Seizuretastic', -2000, -1000);
	setScrollFactor('Seizuretastic', 0, 0);

	addLuaSprite('Seizuretastic', false);
	addLuaSprite('Seizuretastic', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end