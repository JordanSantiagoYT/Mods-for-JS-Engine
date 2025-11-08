shake = 0.0
function opponentNoteHit()
	if shake < 0.03 then
		shake = shake + 0.001;
	else shake = 0.03;
	end
end
function onUpdatePost(elapsed)
	if shake > 0.003 then
		triggerEvent('Screen Shake', '0.02, '..shake, '0.02, '..shake)
	end
	shake = 0
end