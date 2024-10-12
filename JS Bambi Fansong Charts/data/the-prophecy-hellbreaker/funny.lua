--credit to miksel for this script lol, i just edited it a bit

renderingMode = false
fpsDivide = 1;
shake = 0;

function onCreatePost()
	renderingMode = getPropertyFromClass('ClientPrefs', 'ffmpegMode')
	if renderingMode then
		fpsDivide = getPropertyFromClass('ClientPrefs', 'targetFPS') / 60
	else
		fpsDivide = getPropertyFromClass('ClientPrefs', 'framerate') / 60
	end
end

function onUpdate(elapsed)
    clearEffects('HUD')
    clearEffects('game')
    end
function onUpdatePost(elapsed)
    shake = shake*0.05 / fpsDivide
    addChromaticAbberationEffect('game', shake)
    addChromaticAbberationEffect('hud', shake)
    end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if shake < 0.15 then
	shake = shake + 0.05;
    end
end