function onCreatePost()
	-- background shit
    makeLuaSprite('nonworld', 'illusionaryBG/nonworld', -1700,-900)
    addLuaSprite('nonworld')
	scaleObject('nonworld', 3,3.5);
    setScrollFactor('nonworld', 0, 0);
    addGlitchEffect('nonworld', 2, 2)

    makeLuaSprite('nonland', 'illusionaryBG/nonland', -570, -370)
    addLuaSprite('nonland')
    scaleObject('nonland', 2.25,2.25)
end