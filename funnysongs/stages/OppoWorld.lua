function onCreate()
	-- background shit
	makeLuaSprite('back', 'oppo/OppositonLol', -1000, -300);
	setScrollFactor('back', 0.5, 0.5);
	scaleObject('back', 1.3, 1.3)
	
	makeLuaSprite('front', 'oppo/ThanosGround', 650, 600);
	setScrollFactor('front', 0.9, 0.9);
	scaleObject('front', 0.9, 0.9);

	addLuaSprite('back', false)
	addLuaSprite('front', false)

	close(true);
end