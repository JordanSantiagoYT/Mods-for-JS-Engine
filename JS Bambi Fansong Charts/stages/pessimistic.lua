function onCreatePost()
    makeLuaSprite('hell', 'pessimBG/hell', -4000, -2000);
    setScrollFactor('hell', 1, 0);
    scaleObject('hell', 4, 4);
    addGlitchEffect('hell', 3, 5);

    addLuaSprite('hell');

    addChromaticAbberationEffect('game');

end