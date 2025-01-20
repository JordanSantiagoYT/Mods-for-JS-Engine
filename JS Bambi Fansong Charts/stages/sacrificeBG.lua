function onCreate()
	-- background shit
	makeLuaSprite('back', 'sacrifice/Bg', -300, -200);
	setScrollFactor('back', 1, 1);
	scaleObject('back', 2, 2)
	
	makeLuaSprite('front', 'sacrifice/Platform', 800, 400);
	setScrollFactor('front', 1, 1);
	scaleObject('front', 0.9, 0.9);

	addLuaSprite('back', false)
	addLuaSprite('front', false)

	close(true);
end