function onSongStart()
	setProperty('shouldKillNotes', false)
end
function onBeatHit()
	if curBeat == 68 then
		loopTheSong(9836)
	end
end