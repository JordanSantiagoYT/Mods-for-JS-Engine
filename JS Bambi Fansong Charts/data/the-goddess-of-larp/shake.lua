shake = 0.0
shakeAmt = 0.002
maxShake = 0.01
function opponentNoteHit()
	if shake < maxShake then
		shake = shake + shakeAmt;
	else shake = maxShake;
	end
end
function onUpdatePost(elapsed)
	if shake > 0 then
		triggerEvent('Screen Shake', '0.02, '..shake, '0.02, '..shake)
	end
	shake = 0
end