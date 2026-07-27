function onCreate()
	setProperty('dad.healthColorArray', {255, 0, 0})
end

function onCreatePost()
	makeLuaSprite('bg', 'vsdaa/bgRed', -1500,-1000);
	addLuaSprite('bg', false);
	setScrollFactor('bg', 0, 0);
	addGlitchEffect('bg', 5000, 8000)
	scaleObject('bg', 10,10)
	setProperty('bg.alpha', 1)

	makeLuaSprite('plat', 'vsdaa/plat', -600, 0);
	addLuaSprite('plat', false);
	scaleObject('plat', 2,2)
	addHaxeLibrary('FlxBackdrop', 'flixel.addons.display')
	addHaxeLibrary('FlxAxes', 'flixel.util')

	runHaxeCode([[
    		var danielaBG = new FlxBackdrop(Paths.image('daniela'));
    		danielaBG.scrollFactor.set(0.15, 0.15);
 		game.insert(3, danielaBG);
		danielaBG.color = 0xFFFF0000;
		danielaBG.alpha = 0;
    		setVar('danielas', danielaBG);
	]])

	setProperty('boyfriendGroup.color', getColorFromHex('ff0000'))
	setProperty('dadGroup.color', getColorFromHex('FF2222'))
	setProperty('plat.color', getColorFromHex('FF2222'))
	setProperty('bg.color', getColorFromHex('FF2222'))
end