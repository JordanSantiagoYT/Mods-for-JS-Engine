function onCreate()
makeLuaSprite('bg', nil, -2600, -1500)
makeGraphic('bg', 6450, 3700)
setScrollFactor('bg', 0, 0)
addLuaSprite('bg', false)
setSpriteShader("bg", "nullify")
initLuaShader("eons")
end
function onUpdate(elapsed)
setShaderFloat('bg', 'iTime', getSongPosition()/1000)
end