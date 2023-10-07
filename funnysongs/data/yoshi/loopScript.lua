function onSongStart()
	setProperty('shouldKillNotes', false)
end
function onBeatHit()
	if difficultyName == 'Normal' then
	if curBeat == 68 then
		loopTheSong(9836)
	end
	end
	if difficultyName == 'Hard' then
	if curBeat == 164 then
		loopTheSong(1960)
	end
	end
end