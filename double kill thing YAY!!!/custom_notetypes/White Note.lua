function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'White Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'WhiteNotes');
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', false);
		end
	end
end