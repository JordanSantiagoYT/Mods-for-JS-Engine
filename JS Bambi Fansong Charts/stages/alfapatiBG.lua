function onCreate()
	setProperty('dad.healthColorArray', {84, 4, 133})
end
function onCreatePost()
	-- background shit
	makeLuaSprite('back', 'alfapatiBG', -1400, -800);
	setScrollFactor('back', 0, 0);
	scaleObject('back', 2, 2)
	addLuaSprite('back', false);
	addGlitchEffect('back', 2,5,0.1)
	doTweenColor('bfColor', 'boyfriend', 'c591e6', 0.01)

	makeLuaSprite('plat', 'platform mirrored', getProperty('boyfriendGroup.x') - 240, getProperty('boyfriendGroup.y') + 520);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.7, 0.7);
	setProperty('plat.color', getColorFromHex('6b05ab'))
	addLuaSprite('plat', false)

	makeLuaSprite('oppSprite','AlfapatiGuy',-400,50)
	scaleObject('oppSprite', 0.8, 0.8)
	addLuaSprite('oppSprite',false)
	setScrollFactor('oppSprite', 1,1)
end
function onEvent(n)
	if n == 'Change Character' then
		doTweenColor('bfColor', 'boyfriend', 'c591e6', 0.001)
	end
end