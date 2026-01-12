

function onCreatePost()
	-- background shit
	makeLuaSprite('back', 'oppo/OppositonLol', -1400, -1400);
	setScrollFactor('back', 0, 0);
	scaleObject('back', 3, 3)
	addLuaSprite('back', false);
	addGlitchEffect('back', 2,5,0.1)

	makeLuaSprite('front','oppo/ThanosGround',550,550)
	addLuaSprite('front',false)
	setScrollFactor('front', 1,1)
end