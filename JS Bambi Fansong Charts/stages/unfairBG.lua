function onCreate()
	makeLuaSprite('unfairBG', 'expunged/unfairnessBG',-775, -475)
	scaleObject('unfairBG', 3, 3);
	addLuaSprite('unfairBG',false)
	addGlitchEffect('unfairBG',2,5,0.1)
end

function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat = (songPos/1780)*(bpm/60)
    doTweenY(dadTweenY, 'dad', 101-110*math.sin((currentBeat*0.25)*math.pi),0.001)
end
