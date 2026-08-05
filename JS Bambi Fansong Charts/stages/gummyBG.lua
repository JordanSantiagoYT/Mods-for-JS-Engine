function onCreatePost()
	makeLuaSprite('bg', 'GummibarFloor', -1700,-700);
	addLuaSprite('bg', false);
	scaleObject('bg', 2,2)
	setProperty('bg.alpha', 1)
end