function onCreatePost()
    initLuaShader('GlitchShader')
    
    makeLuaSprite("bg", "trianglesBg", -2048/2, -2048/2)
    setScrollFactor("bg", 0.5, 0.5)
    setPropertyLuaSprite("bg", "antialiasing", false)
    scaleObject("bg", 1.5, 1.5)
    addLuaSprite("bg", false)

    setSpriteShader("bg", "GlitchShader")
end

local elapsedTime = 0
function onUpdate(elapsed)
    elapsedTime = elapsedTime + elapsed
    setShaderFloat("bg", "uTime", elapsedTime)
end