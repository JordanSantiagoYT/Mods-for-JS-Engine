function onCreate()
	makeLuaSprite('unfairBG', 'expunged/unfairnessBG',-75, -475)
	scaleObject('unfairBG', 3.5, 3.5);
	addLuaSprite('unfairBG',false)
	addGlitchEffect('unfairBG',2,5,0.1)

	makeLuaSprite('cheating', 'expunged/CheatingBG', -1875, -875)
	scaleObject('cheating', 1.75, 1.75);
    	addLuaSprite('cheating')
    	addGlitchEffect('cheating',2,5,0.1)
end

function onStepHit()
	if curStep == 640 or curStep == 1152 then
		setProperty('cheating.alpha', 0)
	end
	if curStep == 896 or curStep == 0 then
		setProperty('cheating.alpha', 1)
	end
end
