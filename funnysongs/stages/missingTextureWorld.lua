function onCreate()
	makeLuaSprite('bg', 'lol/MissingBG', -750, -400)
	setObjectOrder('bg', 0)
	setProperty('bg.antialiasing',false)
	setScrollFactor('bg', 0, 0)
	addGlitchShader('bg', 0.10, 200, 6)
	addLuaSprite('bg', false)
	close(true);
end