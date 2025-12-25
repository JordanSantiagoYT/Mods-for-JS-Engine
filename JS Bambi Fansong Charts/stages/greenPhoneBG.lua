function onCreate()
	-- background shit
	makeLuaSprite('bg', 'greenPhoneBG', -400, -200);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 1, 1)
	addGlitchEffect('bg', 2, 5, 0.1)
	addLuaSprite('bg', false);
end