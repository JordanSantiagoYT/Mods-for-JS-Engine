function onCreate()
makeLuaSprite('plat', 'sillyspasm/platform', -3000, -2750);
setScrollFactor('plat', 1, 1);
scaleObject('plat', 100, 3);
setObjectOrder('plat', 1);

makeAnimatedLuaSprite('bg', 'sillyspasm/bg', -500, -1000);
addAnimationByPrefix('bg', 'sillyspasm', 'idle', 24, true)
setScrollFactor('bg', 1, 1);
scaleObject('bg', 6, 6);
setObjectOrder('bg', 0);

addLuaSprite('plat', false);
addLuaSprite('bg', false);
close(true);
end
