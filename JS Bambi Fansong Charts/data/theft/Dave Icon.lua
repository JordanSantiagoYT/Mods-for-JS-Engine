--made by Jordan Santiago (modified from a Double Kill psych port lol)

iconName = 'dave' --Icon name. Use the filename for the icon. (must be named "icon-bambi")
iconWidth = 150 --Icon's width. Used to create the icon frames. (set this according to the width of 1 frame!)
isBF = false --Whether or not the icon should go on BF's side.
tagName = iconName..'Icon' --Helper variable because i'm lazy LOL
iconUse = (isBF and 'iconP1' or 'iconP2')
offsets = {-60, -30} --Offset from icon. (Put negative numbers if it goes on the opponent's side)

-- val 1 is whether to use them, vals 2, 3, and 4 are the colors
local hpColors = {true, 15,95,255}

function onCreatePost()
	addHaxeLibrary('FlxBar', 'flixel.ui')
	if not hideHud then
		makeAnimatedLuaSprite(tagName, nil, getProperty(iconUse..'.x'), getProperty(iconUse..'.y'))
		loadGraphic(tagName, 'icons/icon-'..iconName, iconWidth)
		if isBF then
			addAnimation(tagName, 'icons/icon-'..iconName, {0, 1}, 0, true)
		else
			addAnimation(tagName, 'icons/icon-'..iconName, {1, 0}, 0, false)
		end
		addLuaSprite(tagName, true)
		setObjectOrder(tagName, getObjectOrder(iconUse) - 1)
		setObjectCamera(tagName, 'hud')
		setProperty(tagName..'.flipX', isBF)
		if hpColors[1] == true then
			runHaxeCode([[
				var p2Bar:FlxBar = new FlxBar(game.healthBarBG.x + 4, game.healthBarBG.y + 4, 0, game.healthBarBG.width - 8, (game.healthBarBG.height - 6) * 0.5, game,
			'displayedHealth', 0, game.maxHealth);
				p2Bar.cameras = [game.camHUD];
				p2Bar.flipX = true;
				game.p2Bar.scrollFactor.set();
				game.insert(game.members.indexOf(game.healthBarBG), p2Bar);
				if (ClientPrefs.smoothHealth) p2Bar.numDivisions = (p2Bar.width);
           			p2Bar.createFilledBar(0xFF]]..rgbToHex({hpColors[2], hpColors[3], hpColors[4]})..[[, 0xFF]]..getIconColor('boyfriend')..[[);
				setVar('p2Bar', p2Bar);
			]])
		end
	end
end
function onUpdatePost()
	if not hideHud then
		setProperty(tagName..'.x', getProperty(iconUse..'.x') + offsets[1])
		setProperty(tagName..'.y', getProperty(iconUse..'.y') + offsets[2])
		setProperty(tagName..'.scale.x', getProperty(iconUse..'.scale.x'))
		setProperty(tagName..'.scale.y', getProperty(iconUse..'.scale.y'))
		setObjectOrder(tagName, getObjectOrder(iconUse) - 1)
		setProperty(tagName..'.angle', getProperty(iconUse..'.angle'))
		setProperty(tagName..'.alpha', getProperty(iconUse..'.alpha'))

		setProperty('p2Bar.x', getProperty('healthBar.x'))
		setProperty('p2Bar.y', getProperty('healthBar.y'))
		setProperty('p2Bar.scale.x', getProperty('healthBar.scale.x'))
		setProperty('p2Bar.scale.y', getProperty('healthBar.scale.y'))
		setProperty('p2Bar.angle', getProperty('healthBar.angle'))
		setProperty('p2Bar.alpha', getProperty('healthBar.alpha'))
	end
	if isBF and getProperty('healthBar.percent') < 20 or not isBF and getProperty('healthBar.percent') > 80 then
		setProperty(tagName..'.animation.curAnim.curFrame', (isBF and '1' or '0'))
	else
		setProperty(tagName..'.animation.curAnim.curFrame', (isBF and '0' or '1'))
	end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end
