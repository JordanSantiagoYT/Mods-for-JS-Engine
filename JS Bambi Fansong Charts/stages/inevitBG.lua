function onCreate()
	-- background shit
	makeLuaSprite('bg', 'moribundBG', -1100, -600);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 2, 2);
	addLuaSprite('bg', false);

    	makeLuaSprite('pillar', 'pillar', 870,130)
    	setLuaSpriteScrollFactor('pillar', 0.9, 0.9); 
    	addLuaSprite('pillar')
	scaleObject('pillar', 4.3,4.3);
    	setScrollFactor('pillar', 1, 1);

	initLuaShader("WaterGalaxy")
	setSpriteShader("bg", "WaterGalaxy")
end

function onCreatePost()
	setObjectOrder('pillar', getObjectOrder('boyfriendGroup') - 1)
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/400)
end