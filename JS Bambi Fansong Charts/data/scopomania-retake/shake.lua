shake = 0.0
shakeAmt = 0.003
maxShake = 0.02
enabled = false

function opponentNoteHit()
	if not enabled then return end
	if shake < maxShake then
		shake = shake + shakeAmt;
	else shake = maxShake;
	end
end
function onUpdatePost(elapsed)
	if shake > 0.01 then
		triggerEvent('Screen Shake', '0.05, '..shake)
	end
	shake = 0
end
function onStepHit()
	if curStep == 1288 then
		enabled = true
		maxShake = 0.02
	end
	if curStep == 1792 then
		enabled = false
	end
end