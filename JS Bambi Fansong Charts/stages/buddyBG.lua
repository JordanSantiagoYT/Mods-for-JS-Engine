function onCreate()
	-- background shit
	makeLuaSprite('budBG', 'BuddyStage', -500, -400);
	setLuaSpriteScrollFactor('budBG', 1, 1);
	scaleObject('budBG', 2, 2)
	addLuaSprite('budBG', false);
end