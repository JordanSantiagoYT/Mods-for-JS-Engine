function onCreatePost()
    makeLuaSprite('bg', 'upheaval/unfair', -600, -400);
    setScrollFactor('bg', 0.3, 0.3);
	addGlitchEffect('bg', 2, 5, 0.1)

    makeLuaSprite('blocks', 'upheaval/unfairnewblock', -800, -300);
    setScrollFactor('blocks', 0.7, 0.7);

	makeLuaSprite('platform2', 'platform', 220, 280);
	setScrollFactor('platform2', 1, 1);
	scaleObject('platform2', 0.3, 0.3);

    addLuaSprite('bg', false);
    addLuaSprite('blocks', false);
    addLuaSprite('platform2', false);
end