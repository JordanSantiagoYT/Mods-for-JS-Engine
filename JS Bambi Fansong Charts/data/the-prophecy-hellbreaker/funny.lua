--credit to miksel for this script lol, i just edited it a bit
shake = 0;

function onUpdate(elapsed)
    clearEffects('HUD')
    clearEffects('game')
    end
function onUpdatePost(elapsed)
    shake = shake * math.pow(0.05, elapsed * 60)
    addChromaticAbberationEffect('game', shake)
    addChromaticAbberationEffect('hud', shake)
    end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if shake < 0.15 then
	shake = shake + 0.05;
    end
end