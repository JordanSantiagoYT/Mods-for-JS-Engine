function onUpdate()
    songPos = getSongPosition()
	currentBeat = (songPos/1000)*(bpm/60)

    if curStep >= 0 then
        songPos = getSongPosition()
        local currentBeat = (songPos/400)*(bpm/100)
        doTweenY(dadTweenY, 'dad', -100-50*math.sin((currentBeat*0.15)*math.pi),0.01)
	if not mustHitSection then
		cameraSetTarget('dad')
	end
    end
end