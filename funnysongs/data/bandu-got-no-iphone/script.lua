function onUpdate(elapsed)

  if curStep >= 0 then

    songPos = getSongPosition()

    local currentBeat = (songPos/1780)*(bpm/60)

    doTweenY(dadTweenY, 'dad', 101-110*math.sin((currentBeat*0.25)*math.pi),0.001)

  end

end