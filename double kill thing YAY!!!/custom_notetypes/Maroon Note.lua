function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Maroon Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'MaroonNotes');
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
		end
	end
end