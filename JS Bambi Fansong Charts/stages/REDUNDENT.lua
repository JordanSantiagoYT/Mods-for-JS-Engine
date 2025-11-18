function onCreate()
	-- background shit
    makeLuaSprite('REDUNDENTBG', 'REDUNDENTBG', -950,-550)
    setLuaSpriteScrollFactor('REDUNDENTBG', 0.9, 0.9); 
    addLuaSprite('REDUNDENTBG')
	scaleObject('REDUNDENTBG', 12,12);
    setScrollFactor('REDUNDENTBG', 0, 0);

    makeLuaSprite('REDUNT', 'REDUNT', 870,200)
    setLuaSpriteScrollFactor('REDUNT', 0.9, 0.9); 
    addLuaSprite('REDUNT')
	scaleObject('REDUNT', 4.3,4.3);
    setScrollFactor('REDUNT', 1, 1);


end

function onCreatePost()
    addGlitchEffect('REDUNDENTBG', 5, 300);
    addGlitchEffect('REDUNDENTBG', 1, 20);
end

