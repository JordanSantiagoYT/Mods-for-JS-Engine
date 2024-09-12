function onCreate()
	-- background
	
	makeLuaSprite('theStage', 'fatherlessBG', 50, 100);
	setScrollFactor('theStage', 1, 1);
	scaleObject('theStage', 1.7, 1.7);
	addLuaSprite('theStage', false);
end