function onCreatePost()
	makeLuaSprite('bg', 'evilManbiBG', -6700, -6000);
	scaleObject('bg', 8, 8)
	setProperty('bg.flipX', true)
	addLuaSprite('bg', false);
end