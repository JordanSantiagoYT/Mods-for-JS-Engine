function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Half 1 Opps Note' then --yeah i got a bit lazy LMAO
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
		end
	end
end