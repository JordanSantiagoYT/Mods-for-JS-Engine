function onCreatePost()
	makeLuaText('ph', "PLACEHOLDER", 720, getProperty("boyfriend.x") - 120, getProperty("boyfriend.y") + 170)
	addLuaText('ph')
	setTextSize('ph', 40)
	setObjectCamera('ph', 'camGame')
	setTextBorder('ph', 3, '000000')
	setProperty('ph.alpha', 0.5)
end
