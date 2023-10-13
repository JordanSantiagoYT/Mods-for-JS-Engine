function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'phone' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_phone'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.07'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'offset.x', '-5'); --offset
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'phone' then
		characterPlayAnim('boyfriend', 'dodge', true)
		setProperty('boyfriend.specialAnim', true);
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'phone' then
		characterPlayAnim('dad', 'singThrow', true)
		characterPlayAnim('boyfriend', 'hit', true)
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		cancelTween('TWEEN NOTE '..direction) --don't crash please
		setPropertyFromGroup('playerStrums', direction, 'alpha', 0) --instant
		noteTweenAlpha('TWEEN NOTE '..direction, direction, 1, 7, 'expoIn')
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'phone' then
		characterPlayAnim('dad', 'singSmash', true)
		setProperty('dad.specialAnim', true);
	end
end