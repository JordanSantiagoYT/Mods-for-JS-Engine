function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BF Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'BFNotes');
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', false);
		end
	end
end