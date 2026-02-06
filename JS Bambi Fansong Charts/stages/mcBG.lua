function onCreate()

	makeAnimatedLuaSprite('bg', 'moribund3purp', 220, -150);
	setScrollFactor('bg', 0.9, 0.9);
	scaleObject('bg', 192, 192)
	setProperty('bg.alpha', 1)
	addLuaSprite('bg', false);
	initLuaShader("MinecraftBlocks")
	setSpriteShader("bg", "MinecraftBlocks")

	makeLuaSprite('oppSprite', 'Netherite_Pickaxe_JE3', -800, 300);
	scaleObject('oppSprite', 2.5, 2.5);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
	setProperty('healthGain', getProperty('healthGain') * 0.4)
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/1000)
end