function onCreatePost()
    makeLuaSprite('predestined', 'morpheus/lean2', -500, -250);
    scaleObject('predestined', 1.2, 1.2);
    setScrollFactor('predestined', 0, 0);

    makeLuaSprite('godforsaken', 'morpheus/lean3', -500, -250);
    scaleObject('godforsaken', 1.2, 1.2);
    setScrollFactor('godforsaken', 0, 0);

    makeLuaSprite('dereken', 'morpheus/lean', -500, -250);
--    scaleObject('dereken', 1.2, 1.2);
    setScrollFactor('dereken', 0.1, 0.1);

	makeLuaSprite('plat', 'morpheus/Platform', 400, 2330);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.9, 0.9);

    addLuaSprite('predestined', false);
    addLuaSprite('godforsaken', false);
    addLuaSprite('dereken', false);
	addLuaSprite('plat', false)

    addWiggleEffect('predestined', 'dreamy');
    addWiggleEffect('godforsaken', 'wave');
    addWiggleEffect('dereken', 'flag');
    addChromaticAbberationEffect('hud', 0.003);
    addChromaticAbberationEffect('game', 0.002);
end