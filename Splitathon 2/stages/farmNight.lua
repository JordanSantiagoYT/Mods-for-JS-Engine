function onCreate()
	-- background shit
	makeLuaSprite('farmnight', 'farmnight', -240, -200);
	setScrollFactor('farmnight', 1, 1);
  scaleObject('farmnight', 1.1, 1.1)

	addLuaSprite('farmnight', false);
end

function onCreatePost()
    for k,tag in pairs(sprs) do
        setProperty(tag..'.color', getColorFromHex('0xFF878787'))
    end

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end