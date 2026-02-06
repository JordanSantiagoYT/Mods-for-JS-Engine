function onCreatePost()
	makeLuaSprite('bg', 'diamondBG', -1520, -500);
	setScrollFactor('bg', 0.9, 0.9);
	scaleObject('bg', 2, 2)
	setProperty('bg.alpha', 1)
	addLuaSprite('bg', false);
	addGlitchEffect('bg', 2,5,0.1)
end