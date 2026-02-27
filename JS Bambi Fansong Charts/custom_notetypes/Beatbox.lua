singAnims = {}

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Beatbox' then
	setProperty('dad.holdTimer', 0)
        characterPlayAnim('dad', singAnims[noteData + 1]..'-beatbox', true)
	setProperty('dad.specialAnim', true)
    end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Beatbox' then
	setProperty('boyfriend.holdTimer', 0)
        characterPlayAnim('boyfriend', singAnims[noteData + 1]..'-beatbox', true)
	setProperty('boyfriend.specialAnim', true)
    end
end

function onCreatePost()
	singAnims = getProperty('singAnimations')
end