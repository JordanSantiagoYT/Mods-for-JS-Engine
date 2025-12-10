function onCreatePost()
	makeLuaSprite('bg', 'Sangtraan/stage', -3200, -2080);
	scaleObject('bg', 3, 3);
   	setScrollFactor('bg', 1, 1);
	addLuaSprite('bg', false);

	makeLuaSprite('oppSprite', 'Sangtraan/char', -2000, -1200);
	scaleObject('oppSprite', 1.3, 1.3);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
end
function onMoveCamera(focus)
	if focus == 'boyfriend' then
		setProperty('defaultCamZoom', 0.75)
	elseif focus == 'dad' then
		setProperty('defaultCamZoom', 0.3)
	end
end
