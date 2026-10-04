shake = 0.0
shakeAmt = 0.005
maxShake = 0.02
function opponentNoteHit()
	if shake < maxShake then
		shake = shake + shakeAmt;
	else shake = maxShake;
	end
end
function onUpdatePost(elapsed)
	if shake > 0.001 then
		triggerEvent('Screen Shake', '0.05, '..shake, '0.05, '..shake)
	end
	shake = 0
end