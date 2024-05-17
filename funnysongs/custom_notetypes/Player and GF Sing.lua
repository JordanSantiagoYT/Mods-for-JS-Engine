function goodNoteHit(id,dir,type,sus)
	if type == 'Player and GF Sing' then
		if not sus then
			characterPlayAnim('gf', getProperty('singAnimations')[math.abs(dir)+1], true)
		end
		setProperty('gf.holdTimer', 0)
	end
end

function opponentNoteHit(id,dir,type,sus)
	if type == 'Player and GF Sing' then
		if not sus then
			characterPlayAnim('gf', getProperty('singAnimations')[math.abs(dir)+1], true)
		end
		setProperty('gf.holdTimer', 0)
	end
end