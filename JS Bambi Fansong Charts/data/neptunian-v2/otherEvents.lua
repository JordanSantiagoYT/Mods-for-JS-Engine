zoomHit = false
function onUpdate(elasped)
	songPos = getSongPosition()
	local currentBeat = (songPos/100)/(curBpm/70)

	if not getProperty('camTwist') then doTweenAngle('ooooWtf?', 'camHUD', -1 * 1 * math.sin((currentBeat+1)+300), 0.005) end
end

function onStepHit()
	if curStep == 1536 or curStep == 4608 then
		zoomHit = true
	end
	if curStep == 2560 or curStep == 5632 then
		zoomHit = false
	end
end

function goodNoteHit()
	if zoomHit then
		triggerEvent('Add Camera Zoom', 0.005, 0.005)
	end
end

function opponentNoteHit()
	if zoomHit then
		triggerEvent('Add Camera Zoom', 0.0025, 0.0025)
	end
end