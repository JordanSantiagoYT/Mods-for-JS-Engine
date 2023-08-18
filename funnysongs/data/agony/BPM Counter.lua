function onCreatePost()
    makeLuaText('bpm',' eventvalue1',1200,30,550)
    setTextSize('bpm', 25)
    addLuaText('bpm')
end
function onUpdate(elapsed)
    setTextString('bpm', ' Current BPM: ' .. curBpm ..'')
end