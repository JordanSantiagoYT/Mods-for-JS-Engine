function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Break Phone Note' then
	setProperty('dad.holdTimer', 0)
	characterPlayAnim('dad', 'phoneSmash', true);
	setProperty('dad.specialAnim', true)
    end
end
function onCreatePost()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Blammed Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Break Phone Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'PHONENOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
	--debugPrint('Script started!')
end