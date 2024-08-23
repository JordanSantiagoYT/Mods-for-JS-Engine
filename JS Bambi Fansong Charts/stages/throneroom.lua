function onCreate()
    -- back shit
    makeLuaSprite('thronesky', 'dethronedBG/thronesky', -4000, -950);
    setLuaSpriteScrollFactor('thronesky', 0.95, 0.95);

    addLuaSprite('thronesky', false);
scaleObject('thronesky', 4.3, 4.3);
addGlitchEffect('thronesky', 2, 8);


    -- front shit
    makeLuaSprite('spikes', 'dethronedBG/spikes', -3300, -950);
    setLuaSpriteScrollFactor('spikes', 0.95, 0.95);

    addLuaSprite('spikes', false);
scaleObject('spikes', 2, 2);


end
