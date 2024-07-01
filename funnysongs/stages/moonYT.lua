function onCreate()
	-- background
	
	makeLuaSprite('theStage', 'groomerBG', 50, 260);
	setScrollFactor('theStage', 1, 1);
	scaleObject('theStage', 1.7, 1.7);
	addLuaSprite('theStage', false);
end