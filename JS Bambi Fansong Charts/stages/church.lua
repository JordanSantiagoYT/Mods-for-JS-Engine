function onCreate()
        makeLuaSprite('bg', 'churchlight/bg', -240, -630);
    setScrollFactor('bg', 0.8, 0.8);

    makeLuaSprite('fg', 'churchlight/floor', -240, -630);
    setScrollFactor('fg', 0.8, 0.8);

    makeLuaSprite('pillars', 'churchlight/pillars', -240, -630);
    setScrollFactor('pillars', 1.1, 1.1);

    addLuaSprite('bg', false);
    addLuaSprite('fg', false);
    addLuaSprite('pillars', false);
    
end