

function onCreatePost()
	-- background shit
	makeLuaSprite('back', 'green/Stars', -900, -400);
	setScrollFactor('back', 0.4, 0.4);
	scaleObject('back', 2, 2)
	addLuaSprite('back', false);

	makeLuaSprite('backGreen', 'green/Green Grid', -600, -400);
	setScrollFactor('backGreen', 0.2, 0.2);
	scaleObject('backGreen', 2, 2)
	addLuaSprite('backGreen', false);
	setProperty('backGreen.alpha', 0)

	makeLuaSprite('back2', 'green/Cube Overlay', -900, -500);
	setScrollFactor('back2', 0.3, 0.3);
	scaleObject('back2', 2, 2)
	addLuaSprite('back2', false);

	makeLuaSprite('backGreen2', 'green/Green bg Outline Shapes', -900, -500);
	setScrollFactor('backGreen2', 0.3, 0.3);
	scaleObject('backGreen2', 2, 2)
	addLuaSprite('backGreen2', false);
	setProperty('backGreen2.alpha', 0)

	makeLuaSprite('front','green/Ground',getProperty('boyfriend.x') - 650, getProperty('boyfriend.y') + 200)
	addLuaSprite('front',false)
	setScrollFactor('front', 1,1)

	makeLuaSprite('frontGreen','green/Ground Green',getProperty('boyfriend.x') - 650, getProperty('boyfriend.y') + 200)
	addLuaSprite('frontGreen',false)
	setScrollFactor('frontGreen', 1,1)
	setProperty('frontGreen.alpha', 0)
end