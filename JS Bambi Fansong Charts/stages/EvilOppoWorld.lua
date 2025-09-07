

function onCreatePost()
	-- background shit
	makeLuaSprite('back', 'oppo/OppositonEvilLol', -900, -600);
	setScrollFactor('back', 0, 0);
	scaleObject('back', 2, 2)
	addLuaSprite('back', false);
	addGlitchEffect('back', 2,5,0.1)

	makeLuaSprite('front','oppo/EvilThanosGround',550,550)
	addLuaSprite('front',false)
	setScrollFactor('front', 1,1)
end