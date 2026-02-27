function onCreatePost()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Blammed Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Partially Visible Note' then
			setPropertyFromGroup('unspawnNotes', i, 'multAlpha', '0.5'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --Disable animation when played
		end
	end
	--debugPrint('Script started!')
end