shake = 0.0
maxShake = 0.02
function opponentNoteHit()
	if shake < maxShake then
		shake = shake + 0.003;
	else shake = maxShake;
	end
end
function onUpdatePost(elapsed)
	if shake > 0 then
		triggerEvent('Screen Shake', '0.02, '..shake, '0.02, '..shake)
	end
	shake = 0
end