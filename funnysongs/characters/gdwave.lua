function goodNoteHit(id, direction, noteType, isSustainNote)
    
    if isSustainNote == false then
		setProperty('boyfriend.angle', 30)
    end

end


function onUpdate(elapsed)
	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		setProperty('boyfriend.angle', 0)
	end
end

