function onCreate()
    makeLuaSprite('bg', 'simplex', -900, 1300);
    setScrollFactor('bg', 1, 1);
    scaleObject('bg', 2.5, 2.5);
    
    addLuaSprite('bg', false);
end