function onCreatePost()
	-- background shit
	makeLuaSprite('back', 'ephemeral/bg1', -1400, -800);
	setScrollFactor('back', 0, 0);
	scaleObject('back', 2, 2)
	addLuaSprite('back', false);
	addGlitchEffect('back', 2,5,0.1)

	makeLuaSprite('back2', 'ephemeral/bg', -1400, -1400);
	setScrollFactor('back2', 0.2, 0.2);
	scaleObject('back2', 1.8, 1.8)
	addLuaSprite('back2', false);
	addGlitchEffect('back2', 2,5,0.1)

	makeLuaSprite('front','ephemeral/plat',850,550)
	addLuaSprite('front',false)
	setScrollFactor('front', 1,1)

	makeLuaSprite('oppSprite','ephemeral/char',-400,50)
	scaleObject('oppSprite', 0.8, 0.8)
	addLuaSprite('oppSprite',false)
	setScrollFactor('oppSprite', 1,1)
end