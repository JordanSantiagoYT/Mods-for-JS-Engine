function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Fake Spam' then
		addHits(5);
		addCombo(5);
		addNPS(10);
   		addScore(350 * 5);
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Fake Spam' then
		addMisses(5);
   		addScore(-10 * 5);
	end
end