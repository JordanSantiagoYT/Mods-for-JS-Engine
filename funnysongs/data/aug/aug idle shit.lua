function onBeatHit()
	if curBeat % 4 == 3 and not dad.animation.curAnim.name == "singLEFT" and not dad.animation.curAnim.name == "singDOWN" and not dad.animation.curAnim.name == "singUP" and not dad.animation.curAnim.name == "singRIGHT" then
	triggerEvent('Play Animation', 'danceLeft', dad)
	end
	if curBeat % 4 == 2 and not dad.animation.curAnim.name == "singLEFT" and not dad.animation.curAnim.name == "singDOWN" and not dad.animation.curAnim.name == "singUP" and not dad.animation.curAnim.name == "singRIGHT" then
	triggerEvent('Play Animation', 'danceMiddle', dad)
	end
	if curBeat % 4 == 1 and not dad.animation.curAnim.name == "singLEFT" and not dad.animation.curAnim.name == "singDOWN" and not dad.animation.curAnim.name == "singUP" and not dad.animation.curAnim.name == "singRIGHT" then
	triggerEvent('Play Animation', 'danceRight', dad)
	end
	if curBeat % 4 == 0 and not dad.animation.curAnim.name == "singLEFT" and not dad.animation.curAnim.name == "singDOWN" and not dad.animation.curAnim.name == "singUP" and not dad.animation.curAnim.name == "singRIGHT" then
	triggerEvent('Play Animation', 'danceMiddle', dad)
	end
end