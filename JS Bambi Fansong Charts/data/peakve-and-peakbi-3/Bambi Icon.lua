--made by Jordan Santiago (modified from a Double Kill psych port lol)

iconName = 'bambi' --Icon name. Use the filename for the icon. (must be named "icon-bambi")
iconWidth = 150 --Icon's width. Used to create the icon frames. (set this according to the width of 1 frame!)
isBF = false --Whether or not the icon should go on BF's side.
tagName = iconName..'Icon' --Helper variable because i'm lazy LOL
iconUse = (isBF and 'iconP1' or 'iconP2')
offsets = {-60, -30} --Offset from icon. (Put negative numbers if it goes on the opponent's side)

function onCreatePost()
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
	end
	if isBF and getProperty('healthBar.percent') < 20 or not isBF and getProperty('healthBar.percent') > 80 then
		setProperty(tagName..'.animation.curAnim.curFrame', (isBF and '1' or '0'))
	else
		setProperty(tagName..'.animation.curAnim.curFrame', (isBF and '0' or '1'))
	end
end