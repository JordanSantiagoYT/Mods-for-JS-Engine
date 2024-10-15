function onCreatePost()
	-- background shit
    makeLuaSprite('theVoid', 'sepbgidk/void', -1200,-800)
    addLuaSprite('theVoid')
    scaleObject('theVoid', 1.5,1.5);
    setScrollFactor('theVoid', 0, 0);

    makeLuaSprite('theLand', 'sepbgidk/sepland', 600, 50)
    addLuaSprite('theLand')
    scaleObject('theLand', 1, 1)
end