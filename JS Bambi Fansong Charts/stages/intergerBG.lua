function onCreate()
        -- background shit
        makeLuaSprite('interger2', 'intOverBG/interger2',0,-1000);
        addLuaSprite('interger2', false);
	setScrollFactor('interger2', 0.9, 0.9);
        scaleObject('interger2', 4, 4);
	addGlitchEffect('interger2',2,5,0.1)
		
	makeLuaSprite('interger1', 'intOverBG/interger1',0,-1000);
        addLuaSprite('interger1', false);
	scaleObject('interger1', 4, 4);
	setScrollFactor('interger1', 0.9, 0.9);
		
	makeLuaSprite('interger platform', 'intOverBG/interger platform',5250,1450);
        addLuaSprite('interger platform',false);
	scaleObject('interger platform', 1, 1);
end

function onMoveCamera(focus)
	if focus == 'boyfriend' then
		setProperty('defaultCamZoom', 0.8)
	elseif focus == 'dad' then
		setProperty('defaultCamZoom', 0.3)
	end
end

