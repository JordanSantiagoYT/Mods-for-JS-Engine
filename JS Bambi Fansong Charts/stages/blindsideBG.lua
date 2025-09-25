
function onCreate()
	-- background shit
	makeLuaSprite('bg', 'blindside/bg', -800, -480);
	addLuaSprite('bg', false);
	setScrollFactor('bg', 0.1, 0.1);
	scaleObject('bg', 1, 1);

	makeLuaSprite('oppSprite', 'blindside/char', -500, -100);
	scaleObject('oppSprite', 0.5, 0.5);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
	setProperty('oppSprite.alpha', 0)
end

function onUpdate()
	setProperty('bg.angle', getSongPosition()/200)
end