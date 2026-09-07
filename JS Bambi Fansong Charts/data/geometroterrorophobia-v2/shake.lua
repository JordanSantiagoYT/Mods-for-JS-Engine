shake = 0.0
shakeAmt = 0.003
maxShake = 0.02

hudTwist = false
angles = 0
angleIntensity = 1
function opponentNoteHit()
	if shake < maxShake then
		shake = shake + shakeAmt;
	else shake = maxShake;
	end
	if hudTwist then
		angles = angles + (math.random() < 0.5 and -angleIntensity or angleIntensity)
	end
end
function onUpdatePost(elapsed)
	if shake > 0.01 then
		triggerEvent('Screen Shake', '0.05, '..shake, '0.05, '..shake)
	end
	shake = 0
	if hudTwist or angles > 2 then
		setProperty('camHUD.angle', angles)
		setProperty('camGame.angle', angles)
	end
	angles = 0
end
function onStepHit()
	if curStep == 2080 then
		hudTwist = true
		maxShake = 0.05
	end
	if curStep == 2593 then
		hudTwist = false
	end
end