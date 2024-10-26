function onCreate()
	makeLuaSprite('unfairBG', 'expunged/unfairnessBG',-775, -475)
	scaleObject('unfairBG', 2.75, 2.75);
	addLuaSprite('unfairBG',false)
	addGlitchEffect('unfairBG',2,5,0.1)

	makeLuaSprite('cheating', 'expunged/CheatingBG', -1475, -875)
	scaleObject('cheating', 1.75, 1.75);
    	addLuaSprite('cheating')
    	addGlitchEffect('cheating',2,5,0.1)
end

function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat = (songPos/1780)*(bpm/60)
    doTweenY(dadTweenY, 'dad', 101-110*math.sin((currentBeat*0.25)*math.pi),0.001)
end

function onStepHit()
	if curStep == 416 then
		setProperty('cheating.alpha', 0)
	end
end
