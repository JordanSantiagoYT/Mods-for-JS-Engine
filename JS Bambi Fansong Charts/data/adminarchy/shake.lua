shake = 0.0
maxShake = 0.025
canShake = false

function opponentNoteHit()
	if not canShake then return end
	if shake < maxShake then
		shake = shake + 0.001;
	else shake = maxShake;
	end
end
function onUpdatePost(elapsed)
	if shake > 0 then
		triggerEvent('Screen Shake', '0.02, '..shake, '0.02, '..shake)
	end
	shake = 0
end

function onStepHit()
	if curSection == 384 or curSection == 800 then
		canShake = true
	end
	if curSection == 640 or curSection == 1184 then
		canShake = false
	end
end