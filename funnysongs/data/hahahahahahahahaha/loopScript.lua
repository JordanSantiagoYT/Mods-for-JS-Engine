function onSongStart()
	setProperty('shouldKillNotes', false)
end
function onBeatHit()
	if curBeat == 116 then
		loopTheSong(34000)
		setProperty('polyphony', getProperty('polyphony') * 2)
	end
end