function onCreate()
	-- background shit
	makeLuaSprite('gdmoment', 'gdBG', -500, -300);
	setLuaSpriteScrollFactor('gdmoment', 1, 1);
	scaleObject('gdmoment', 2, 2)
	addLuaSprite('gdmoment', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end