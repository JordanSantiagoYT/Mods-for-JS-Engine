local camOFFSET = 0;

function onCreate()
    --Iterate over all notes
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'police note' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'funnyAnimal/palooseNote');
            if getPropertyFromGroup('unspawnNotes', i, 'noteData') == 0 then
                setPropertyFromGroup('unspawnNotes', i, 'angle', -90);
            end
            if getPropertyFromGroup('unspawnNotes', i, 'noteData') == 1 then
                setPropertyFromGroup('unspawnNotes', i, 'flipY', true);
            end
            if getPropertyFromGroup('unspawnNotes', i, 'noteData') == 3 then
                setPropertyFromGroup('unspawnNotes', i, 'angle', 90);
            end
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
                setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
            end
        end
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'police note' then
        camOFFSET = getProperty('strumLine.y');

        if downscroll then
            camOFFSET = camOFFSET -25;
        else
            camOFFSET = camOFFSET +25;
        end

        setProperty('strumLine.y', camOFFSET);
        noteTweenY('MOVE OPPONENT LEFT NOTE', 0, camOFFSET, 0.25, 'quadInOut')	
        noteTweenY('MOVE OPPONENT DOWN NOTE', 1, camOFFSET, 0.25, 'quadInOut')
        noteTweenY('MOVE OPPONENT UP NOTE', 2, camOFFSET, 0.25, 'quadInOut')
        noteTweenY('MOVE OPPONENT RIGHT NOTE', 3, camOFFSET, 0.25, 'quadInOut')
        noteTweenY('MOVE PLAYER LEFT NOTE', 4, camOFFSET, 0.25, 'quadInOut')
        noteTweenY('MOVE PLAYER DOWN NOTE', 5, camOFFSET, 0.25, 'quadInOut')
        noteTweenY('MOVE PLAYER UP NOTE', 6, camOFFSET, 0.25, 'quadInOut')
        noteTweenY('MOVE PLAYER RIGHT NOTE', 7, camOFFSET, 0.25, 'quadInOut')
	end
end