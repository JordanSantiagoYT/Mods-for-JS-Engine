function onCreate()
    initLuaShader('GlitchShaderRGBBg');
    makeLuaSprite('bg', 'rgbness bg', -1000, -500);
    setLuaSpriteScrollFactor('bg', 1, 0.5);
    scaleObject('bg', 1.35, 1.35)
    addLuaSprite('bg', false);
    setSpriteShader('bg', 'GlitchShaderRGBBg');
end
elapsedTime = 0;
function onUpdate(elapsed)
    elapsedTime = elapsedTime + elapsed
    setShaderFloat('bg', 'uTime', elapsedTime / 2);
end