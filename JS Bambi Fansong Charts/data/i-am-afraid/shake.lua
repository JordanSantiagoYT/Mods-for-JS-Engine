shake = 0.0
function opponentNoteHit()
	triggerEvent('Add Camera Zoom', 0.001, 0.001)
	if shake < 0.015 then
		shake = shake + 0.003;
	else shake = 0.015;
	end
end
function onUpdatePost(elapsed)
	if shake > 0 then
		triggerEvent('Screen Shake', '0.02, '..shake, '0.02, '..shake)
	end
	shake = 0
end