function onCreate()
    makeLuaSprite('vehemenceBG', 'phono/phonoBG', -1300, -500);
    scaleObject('vehemenceBG', 1.5, 1.5);
    setScrollFactor('vehemenceBG', 0, 0);

	makeLuaSprite('platform2', 'phono/phonoGround', 420, 2280);
	setScrollFactor('platform2', 1, 1);
	scaleObject('platform2', 0.3, 0.3);
    
    addLuaSprite('vehemenceBG', false);
    addLuaSprite('platform2', false);

    addWiggleEffect('vehemenceBG', 'flag');
    addChromaticAbberationEffect('hud', 0.003);
    addChromaticAbberationEffect('game', 0.003);
    addGlitchEffect('vehemenceBG', 1, 1);

    close(true);
end