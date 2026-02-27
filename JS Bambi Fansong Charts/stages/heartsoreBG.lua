function onCreatePost()
	makeLuaSprite('bg', 'heartsoreBG', -1020, -600);
	setScrollFactor('bg', 0.2, 0.2);
	scaleObject('bg', 1, 1)
	setProperty('bg.alpha', 1)
	addLuaSprite('bg', false);
	--addGlitchEffect('bg', 2,5,0.1)
end