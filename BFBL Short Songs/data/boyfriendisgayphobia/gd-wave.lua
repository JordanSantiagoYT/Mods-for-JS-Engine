
function opponentNoteHit(id, direction, noteType, isSustainNote)
    
    if isSustainNote == false then
		setProperty('dad.angle', -30)
    end

end


function onUpdate(elapsed)
	if getProperty('dad.animation.curAnim.name') == 'idle' then
		setProperty('dad.angle', 0)
	end
end

