function onCreatePost()
	luaDebugMode = true
	if curStage == 'oppoWorld' or curStage == 'OppoWorld' then
		setProperty('dad.x', getProperty('dad.x') - 800)
		setProperty('dad.y', getProperty('dad.y') + 600)
	end
end