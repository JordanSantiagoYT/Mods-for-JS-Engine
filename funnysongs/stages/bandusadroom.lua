function onCreate()
	-- background spoopt
	makeLuaSprite('poop', 'poop', -1500, -900);
	setLuaSpriteScrollFactor('poop', 0, 0);
	scaleObject('poop', 2, 2)
	addLuaSprite('poop', false);

	makeLuaSprite('poop2', 'poop2', -1800, -900);
	setLuaSpriteScrollFactor('poop2', 0, 0);
	scaleObject('poop2', 2, 2)
	addLuaSprite('poop2', false);
	
	close(true); --For performance reasons, close tpoops script once the stage is fully loaded, as tpoops script won't be used anymore after loading the stage
end