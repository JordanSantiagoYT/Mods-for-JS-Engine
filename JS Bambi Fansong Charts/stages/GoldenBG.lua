function onCreatePost()
	-- background shit
	makeLuaSprite('back', 'golden/GoldenClouds', -1400, -800);
	setScrollFactor('back', 0, 0);
	scaleObject('back', 2, 2)
	addLuaSprite('back', false);
	addGlitchEffect('back', 2,5,0.1)

	makeLuaSprite('back2', 'golden/CubesGolden', -1400, -1400);
	setScrollFactor('back2', 0.2, 0.2);
	scaleObject('back2', 1.8, 1.8)
	addLuaSprite('back2', false);
	addGlitchEffect('back2', 1,2,0.1)

	makeLuaSprite('back3', 'golden/TrianglesGolden', -1400, -1400);
	setScrollFactor('back3', 0.5, 0.5);
	scaleObject('back3', 1.8, 1.8)
	addLuaSprite('back3', false);
	addGlitchEffect('back3', 2,5,0.1)

	makeLuaSprite('front','golden/Platform',850,550)
	addLuaSprite('front',false)
	setScrollFactor('front', 1,1)
end