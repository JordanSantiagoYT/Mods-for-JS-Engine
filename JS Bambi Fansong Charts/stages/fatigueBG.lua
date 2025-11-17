function onCreatePost()
    makeLuaSprite('bg', 'fatigueBG', -2000, -900);
	scaleObject('bg', 2, 2)
    addLuaSprite('bg');
    addGlitchEffect('bg', 2, 5, 0.1);
end