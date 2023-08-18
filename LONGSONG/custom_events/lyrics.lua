lyricNumber = 0

function onEvent(name, value1, value2)
    if name == 'lyrics' then
        lyricNumber = lyricNumber + 1
        lyricNumber2 = lyricNumber -1
        lyricNumber3 = lyricNumber -2
        lyricNumber4 = lyricNumber -3
        makeLuaText(lyricNumber, '', screenWidth, 0, 550)
        addLuaText(lyricNumber)
        setTextSize(lyricNumber, 40)
        setTextString(lyricNumber, value1)
        setTextColor(lyricNumber, 255,255,255)
        doTweenY(lyricNumber, lyricNumber, 500, 0.5, 'QuadOut')
        doTweenY(lyricNumber2, lyricNumber2, 450, 0.5, 'QuadOut')
        doTweenY(lyricNumber3, lyricNumber3, 400, 0.5, 'QuadOut')
        setProperty(lyricNumber2 .. '.alpha', 0.5)
        setProperty(lyricNumber3 .. '.alpha', 0.25)
        setProperty(lyricNumber4 .. '.visible', false)
    end
end