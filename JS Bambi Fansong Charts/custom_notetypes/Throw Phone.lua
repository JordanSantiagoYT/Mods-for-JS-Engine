function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Throw Phone' then
	setProperty('dad.holdTimer', 0)
	characterPlayAnim('dad', 'phoneThrow', true);
	setProperty('dad.specialAnim', true)
    end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Throw Phone' then
	setProperty('dad.holdTimer', 0)
	characterPlayAnim('dad', 'phoneThrow', true);
	setProperty('dad.specialAnim', true)
	setProperty('bf.holdTimer', 0)
	characterPlayAnim('bf', 'dodge', true);
	setProperty('bf.specialAnim', true)
	setProperty('gf.holdTimer', 0)
	characterPlayAnim('gf', 'cheer', true);
	setProperty('gf.specialAnim', true)
    end
end

function noteMiss(id, noteData, noteType, isSustainNote)
    if noteType == 'Throw Phone' then
	setProperty('dad.holdTimer', 0)
	characterPlayAnim('dad', 'phoneThrow', true);
	setProperty('dad.specialAnim', true)
	setProperty('bf.holdTimer', 0)
	characterPlayAnim('bf', 'hurt', true);
	setProperty('bf.specialAnim', true)
	setPropertyFromGroup('strumLineNotes', noteData + 4, 'alpha', 0); --bye strum!
	noteTweenAlpha('noteBack', noteData + 4, 1, 7, 'expoIn')
    end
end

function onCreatePost()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Blammed Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Throw Phone' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'PHONENOTE_assets'); --Change texture

			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.07'); --Change texture
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
	--debugPrint('Script started!')
end