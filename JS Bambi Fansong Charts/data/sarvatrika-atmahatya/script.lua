luaDebugMode = true

function onUpdate(elapsed)
	songPos = getSongPosition()
	if curStep >= 0 then
		local currentBeat = (songPos/1000)*(bpm/300)
		doTweenY(dadTweenY, 'dad', 150-130*math.sin((currentBeat*0.25)*math.pi),0.001)
		
		if mustHitSection == false then
			cameraSetTarget("dad")
		end
	end
end