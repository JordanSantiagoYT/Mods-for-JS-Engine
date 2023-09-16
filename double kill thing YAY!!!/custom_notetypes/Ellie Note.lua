function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Ellie Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'EllieNotes');
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
		end
	end
end