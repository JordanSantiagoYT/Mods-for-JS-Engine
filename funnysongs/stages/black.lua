function onCreate()
    makeLuaSprite('Black', 'coolerBG/black', -1600, 1200);
    setScrollFactor('Black', 1, 1);
    scaleObject('Black', 2, 2);

	makeLuaSprite('Black2', 'coolerBG/blackblock', -1600, 900);
	setScrollFactor('Black2', 1, 1);
	scaleObject('Black2', 2, 2);

	makeLuaSprite('Black3', 'coolerBG/blacklplat', -600, 1930);
	setScrollFactor('Black3', 1, 1);
	scaleObject('Black3', 1.2, 1.2);
    
    addLuaSprite('Black', false);
    addLuaSprite('Black2', false);
    addLuaSprite('Black3', false);

    addChromaticAbberationEffect('hud', 0.007);
    addChromaticAbberationEffect('game', 0.006);
    addGlitchEffect('Black', 1, 1);

    close(true);
end