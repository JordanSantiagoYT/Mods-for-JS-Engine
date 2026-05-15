-- freaky!

function onCreatePost()
	luaDebugMode = true
	-- background shit
	makeLuaSprite('back', 'redGradient', -1400, 600);
	setScrollFactor('back', 0, 0);
	scaleObject('back', 2, 2)
	addLuaSprite('back', false);
end

redEnabled = false
function onUpdate(elapsed)
	if redEnabled then
		songPos = getSongPosition()
		local currentBeat = (songPos/4000)*(curBpm/90)
		setProperty('back.y', 600 + 600*math.sin((currentBeat)), 0.05)
	end
end

function onStepHit()
	if curStep == 512 then
		redEnabled = true
	end
	if curStep == 1248 then
		redEnabled = false
	end
end