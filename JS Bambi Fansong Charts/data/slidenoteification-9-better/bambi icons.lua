function onCreate()
	if not hideHud then
	makeAnimatedLuaSprite('icon5', nil, getProperty('iconP1.x'), getProperty('iconP1.y'))
	loadGraphic('icon5', 'icons/icon-bambi', 150)
	addAnimation('icon5', 'icons/icon-bambi', {0, 1}, 0, true)
	addAnimation('icon5', 'icons/icon-bambi', {1, 0}, 0, true)
	addLuaSprite('icon5', true)
	--setProperty('icon3.antialiasing', false)
	setObjectOrder('icon5', getObjectOrder('iconP2') - 1)
	setObjectCamera('icon5', 'hud')
	setProperty('icon5.flipX', true)
	end
end
function onUpdatePost()
	if not hideHud then
	setProperty('icon5.y', getProperty('iconP1.y'))
	setProperty('icon5.x', getProperty('iconP1.x') + 140)
	setProperty('icon5.scale.x', getProperty('iconP1.scale.x'))
	setProperty('icon5.scale.y', getProperty('iconP1.scale.y'))
	setObjectOrder('icon5', getObjectOrder('iconP1') - 1)
	setProperty('icon5.angle', getProperty('iconP1.angle'))
	setProperty('icon5.alpha', getProperty('iconP1.alpha'))
	end
	if getProperty('healthBar.percent') < 20 then
		setProperty('icon5.animation.curAnim.curFrame', '1')
	else
		setProperty('icon5.animation.curAnim.curFrame', '0')
	end
end