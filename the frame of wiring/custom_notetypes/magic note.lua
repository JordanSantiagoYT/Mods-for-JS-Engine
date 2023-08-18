function onCreate()
    --Iterate over all notes
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'magic note' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'funnyAnimal/magicNote');
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
                setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
            end
        end
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'magic note' then
        setProperty('camGame.angle', getRandomInt(-120, 120))
        setProperty('camHUD.angle', getRandomInt(-120, 120))

        cancelTween('angle game');
        cancelTween('angle hud');
        doTweenAngle('angle game', 'camGame', 0, 9, 'quadInOut')
        doTweenAngle('angle hud', 'camHUD', 0, 9, 'quadInOut')
	end
end