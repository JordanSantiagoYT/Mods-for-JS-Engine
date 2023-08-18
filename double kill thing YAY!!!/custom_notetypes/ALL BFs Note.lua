function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'ALL BFs Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'ALLBFnotes');
		end
	end
end