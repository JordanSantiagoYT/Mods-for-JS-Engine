
function onCreatePost()
    	makeLuaSprite('bg', 'pissdrinker/bg', -1000, -500);
    	addLuaSprite('bg');
	scaleObject('bg', 2.4, 2.4)
    	addGlitchEffect('bg', 2, 5, 0.1);
	setLuaSpriteScrollFactor('bg', 0, 0)
end