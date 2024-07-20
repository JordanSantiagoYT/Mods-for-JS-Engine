nightColor = 'AAAADD';
elapsedtime = 0.0;
function onCreate()
	-- background shit
	makeLuaSprite('graysky', 'graysky', -600, -300);
	setScrollFactor('graysky', 0.9, 0.9);

	makeLuaSprite('BombuBG', 'bombuStuff/BombuBG', -1350, -600);
	setScrollFactor('BombuBG', 0.8, 0.8);
	scaleObject('BombuBG', 1.5, 1.5);
	addGlitchEffect('BombuBG', 2, 5);
	
	makeLuaSprite('poop', '', -500, -500);
	makeGraphic('poop', 1280 * 3, 720 * 3, '000000');
	setScrollFactor('poop', 0, 0);

	makeLuaSprite('Laptop Platform', 'bombuStuff/Laptop_Platform', 800, 150);
	setScrollFactor('Laptop Platform', 1.0, 1.0);
	scaleObject('Laptop Platform', 2.6, 2.6);

	addLuaSprite('graysky', false);	
	addLuaSprite('BombuBG', false);
	addLuaSprite('Laptop Platform', false);
	addLuaSprite('poop', false);
	addLuaSprite('darken', true);
end

function onCreatePost()
	doTweenColor('bfColor', 'boyfriend', nightColor, 0.0001);
	doTweenColor('gfColor', 'gf', nightColor, 0.0001);
	doTweenColor('dadColor', 'dad', nightColor, 0.0001);
end

function onUpdate(elapsed)
	elapsedtime = elapsedtime + elapsed;
	
	setProperty('poop.alpha', math.sin(elapsedtime) / 5 + 0.4);
end