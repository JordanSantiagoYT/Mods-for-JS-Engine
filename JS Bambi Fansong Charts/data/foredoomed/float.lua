--credits to BFDI 26 for this code
function onUpdatePost(elapsed)
	setProperty('dadGroup.x', getProperty('dadGroup.x') + 2 * math.cos(curDecBeat / 16 * math.pi) * elapsed * 30 * playbackRate)
	setProperty('dadGroup.y', getProperty('dadGroup.y') + 2 * math.cos(curDecBeat / 8 * math.pi) * elapsed * 60 * playbackRate)
	if not mustHitSection then cameraSetTarget('dad') end
end