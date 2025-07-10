function onCreatePost()
    makeLuaSprite('hortas', 'hort/deforester', -1150, 1300);
    scaleObject('hortas', 1.2, 1.2);

    makeLuaSprite('hortasbg', 'hort/hortasbg', -1150, 1300);
    scaleObject('hortasbg', 1.2, 1.2);

	makeLuaSprite('platform2', 'hort/Platform', 245, 2050);
	setScrollFactor('platform2', 1, 1);
	scaleObject('platform2', 0.3, 0.3);
	doTweenColor('platform2', 'platform2', 'A020F0' , 0.1, 'linear');

    addLuaSprite('hortas', false);
    addLuaSprite('hortasbg', false);
    addLuaSprite('platform2', false);

    addGlitchEffect('hortas', 2, 5, 0.1);
    addGlitchEffect('hortasbg', 2, 5, 0.1);

end