function onCreate()
	if not hideHud then
	makeAnimatedLuaSprite('icon3', nil, getProperty('iconP1.x'), getProperty('iconP1.y'))
	loadGraphic('icon3', 'icons/icon-bandu-sad', 150)
	addAnimation('icon3', 'icons/icon-bandu-sad', {0, 1}, 0, true)
	addAnimation('icon3', 'icons/icon-bandu-sad', {1, 0}, 0, true)
	addLuaSprite('icon3', true)
	--setProperty('icon3.antialiasing', false)
	setObjectOrder('icon3', getObjectOrder('iconP1') - 1)
	setObjectCamera('icon3', 'hud')
	setProperty('icon3.flipX', true)
	end
end
function onUpdatePost()
	if not hideHud then
	setProperty('icon3.y', getProperty('iconP1.y') + 35)
	setProperty('icon3.x', getProperty('iconP1.x') + 70)
	setProperty('icon3.scale.x', getProperty('iconP1.scale.x') - 0.1)
	setProperty('icon3.scale.y', getProperty('iconP1.scale.y') - 0.1)
	setObjectOrder('icon3', getObjectOrder('iconP1') - 1)
	setProperty('icon3.angle', getProperty('iconP1.angle'))
	end
	if getProperty('healthBar.percent') < 20 then
		setProperty('icon3.animation.curAnim.curFrame', '1')
	else
		setProperty('icon3.animation.curAnim.curFrame', '0')
	end
end