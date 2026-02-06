--made by Jordan Santiago (modified from a Double Kill psych port lol)

iconName = 'bambi' --Icon name. Use the filename for the icon. (must be named "icon-bambi")
iconWidth = 150 --Icon's width. Used to create the icon frames. (set this according to the width of 1 frame!)
isBF = true --Whether or not the icon should go on BF's side.
tagName = iconName..'Icon' --Helper variable because i'm lazy LOL
iconUse = (isBF and 'iconP1' or 'iconP2')
offsets = {30, -20} --Offset from icon. (Put negative numbers for the X if it goes on the opponent's side)
mIcOffsets = {30, -20} --Offset for main icon.

enabled = false --Whether or not the additional icon is enabled.

function onCreatePost()
	if not hideHud then
		makeAnimatedLuaSprite(tagName, nil, getProperty(iconUse..'.x'), getProperty(iconUse..'.y'))
		loadGraphic(tagName, 'icons/icon-'..iconName, iconWidth)
		addAnimation(tagName, 'icons/icon-'..iconName, {0, 1}, 0, isBF)
		addAnimation(tagName, 'icons/icon-'..iconName, {1, 0}, 0, isBF)
		addLuaSprite(tagName, true)
		--setProperty('tagName.antialiasing', false)
		setObjectOrder(tagName, getObjectOrder(iconUse) - 1)
		setObjectCamera(tagName, 'hud')
		setProperty(tagName..'.flipX', isBF)
	end
end
function onUpdatePost()
	if not hideHud then
		setProperty(tagName..'.visible', getProperty(iconUse..'.visible') and enabled)
		if not enabled then return end
		setProperty(iconUse..'.scale.x', getProperty(iconUse..'.scale.x') * 0.8)
		setProperty(iconUse..'.scale.y', getProperty(iconUse..'.scale.y') * 0.8)

		setProperty(iconUse..'.offset.x', mIcOffsets[1])
		setProperty(iconUse..'.offset.y', mIcOffsets[2])

		setProperty(tagName..'.x', getProperty(iconUse..'.x') + offsets[1])
		setProperty(tagName..'.y', getProperty(iconUse..'.y') + offsets[2])

		setProperty(tagName..'.scale.x', getProperty(iconUse..'.scale.x'))
		setProperty(tagName..'.scale.y', getProperty(iconUse..'.scale.y'))

		setObjectOrder(tagName, getObjectOrder(iconUse) - 1)
		setProperty(tagName..'.angle', getProperty(iconUse..'.angle'))
		setProperty(tagName..'.alpha', getProperty(iconUse..'.alpha'))
	end
	if getProperty('healthBar.percent') < 20 then
		setProperty(tagName..'.animation.curAnim.curFrame', (isBF and '1' or '0'))
	else
		setProperty(tagName..'.animation.curAnim.curFrame', (isBF and '0' or '1'))
	end
end

function onStepHit()
	if curStep == 512 then enabled = true end
end