function onCreatePost()
    makeLuaText('bpm','bruh',1200,30,550)
    setTextSize('bpm', 25)
    addLuaText('bpm')
end
function onUpdate(elapsed)
    setTextString('bpm', ' Scroll Speed: ' .. getProperty('songSpeed') ..'')
end