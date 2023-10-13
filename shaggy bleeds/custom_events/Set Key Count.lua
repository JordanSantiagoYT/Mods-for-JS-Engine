function onCreate()
    addLuaScript('extra keys hscript') 
    --addHaxeLibrary('Std')
    --addHaxeLibrary('EventNote', 'Note')
    runHaxeCode('game.setOnLuas("keyCount", 4);') --default in case none found
    local eventsLength = getProperty('eventNotes.length')
    for i = 0,eventsLength-1 do 
        if getPropertyFromGroup('eventNotes', i, 'event') == 'Set Key Count' then 
            --debugPrint(getPropertyFromGroup('eventNotes', i, 'event'))
            runHaxeCode('game.setOnLuas("keyCount", '..getPropertyFromGroup('eventNotes', i, 'value1')..');')
        end
    end
end