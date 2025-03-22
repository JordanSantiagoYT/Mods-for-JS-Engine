function onCreate()
	if not hideHud then
	makeAnimatedLuaSprite('icon4', nil, getProperty('iconP1.x'), getProperty('iconP1.y'))
	loadGraphic('icon4', 'icons/icon-splitathon-dave', 150)
	addAnimation('icon4', 'icons/icon-splitathon-dave', {0, 1}, 0, true)
	addAnimation('icon4', 'icons/icon-splitathon-dave', {1, 0}, 0, true)
	addLuaSprite('icon4', true)
	--setProperty('icon4.antialiasing', false)
	setObjectOrder('icon4', getObjectOrder('iconP1') - 1)
	setObjectCamera('icon4', 'hud')
	setProperty('icon4.flipX', true)
	end
end
function onUpdatePost()
	if not hideHud then
	setProperty('icon4.y', getProperty('iconP1.y') - 35)
	setProperty('icon4.x', getProperty('iconP1.x') + 70)
	setProperty('icon4.scale.x', getProperty('iconP1.scale.x'))
	setProperty('icon4.scale.y', getProperty('iconP1.scale.y'))
	setObjectOrder('icon4', getObjectOrder('iconP1') - 1)
	setProperty('icon4.angle', getProperty('iconP1.angle'))
	end
	if getProperty('healthBar.percent') < 20 then
		setProperty('icon4.animation.curAnim.curFrame', '1')
	else
		setProperty('icon4.animation.curAnim.curFrame', '0')
	end
end