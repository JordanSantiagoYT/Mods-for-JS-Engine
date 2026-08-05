--credits to BFDI 26 for this code (i just edited it)

dadGroupY = 0
function onCreatePost()
	dadGroupY = getProperty('dadGroup.y')
end
function onUpdatePost(elapsed)
	setProperty('dadGroup.y', getProperty('dadGroup.y') + 2 * math.cos(curDecBeat / 8 * math.pi) * elapsed * 60 * playbackRate)
	if not mustHitSection then cameraSetTarget('dad') end
end