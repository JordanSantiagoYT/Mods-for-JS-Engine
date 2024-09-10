function onCreate()
	makeLuaSprite('theBg','dissimBG', -270, -170)
	addLuaSprite('theBg',false)
	scaleObject('theBg', 1.45, 1.45)
	setLuaSpriteScrollFactor('theBg', 0, 0)

	makeLuaSprite('oppSprite', 'demeter_phase_2', -800, 0);
	scaleObject('oppSprite', 1.5, 1.5);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
end
