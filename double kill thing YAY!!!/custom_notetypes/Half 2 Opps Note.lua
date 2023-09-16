function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Half 2 Opps Note' then --yeah i got a bit lazy LMAO
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', false);
		end
	end
end

function opponentNoteHit(id,dir,type,sus)
	if type == 'Half 2 Opps Note' then
		characterPlayAnim('gf', getProperty('singAnimations')[math.abs(dir)+1], true)
		setProperty('gf.holdTimer', 0)
	end
end