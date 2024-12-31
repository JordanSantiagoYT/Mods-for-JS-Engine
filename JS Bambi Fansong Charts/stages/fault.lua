
function onCreate()
	-- background shit
	makeLuaSprite('fault', 'fault', -1300, -700);
	addLuaSprite('fault', false);
	setScrollFactor('fault', 0, 0);
	scaleObject('fault', 1,1);

end
function onCreatePost ()
addChromaticAbberationEffect ('camhud', 0.003)
addChromaticAbberationEffect ('camgame', 0.003)
addBloomEffect ('camhud', 0.003)
addBloomEffect ('camgame', 0.003)
addVCREffect('camgame')
end