function onCreate()
	makeLuaSprite('white', 'white', 0, 0);
	scaleLuaSprite('white', 1.1, 1.1)
	addLuaSprite('white', true);
	setProperty('white.alpha', 0)
	setObjectCamera('white', 'hud')

	makeLuaSprite('red', 'red', 0, 0);
	scaleLuaSprite('red', 1., 1.)
	addLuaSprite('red', true);
	setProperty('red.alpha', 0)
	setObjectCamera('red', 'other')

	makeLuaSprite('overlay', 'overlay ass dk', -350, 50);
	scaleLuaSprite('overlay', 1.1, 1.1)
	addLuaSprite('overlay', true);
	setProperty('overlay.alpha', 0)

	makeLuaSprite('red light', 'iluminao omaga', 850, 450);
	scaleLuaSprite('red light', 1., 1.)
	addLuaSprite('red light', true);
	setProperty('red light.alpha', 0)


	makeLuaSprite('f', 'airshipFlashback', 1750, 650);
	addLuaSprite('f', false);
	setProperty('f.alpha', 0)
	scaleLuaSprite('f', 1.5, 1.5)

	makeAnimatedLuaSprite('d', 'defeat', 1150, 600);
	addAnimationByPrefix('d', 'idle', 'defeat', 24, true)
	addLuaSprite('d', false);
	setProperty('d.alpha', 0)
	scaleLuaSprite('d', 1, 1)

	makeLuaSprite('black', 'black', 0, 0);
	scaleLuaSprite('black', 1., 1.)
	addLuaSprite('black', true);
	setProperty('black.alpha', 0)
	setObjectCamera('black', 'hud')
end

function onStepHit()
if curStep == 1580 then
doTweenAlpha('flashback', 'f', 0.3, 3)
end
if curStep == 3392 then
doTweenAlpha('blackBox2', 'black', 1, 0.1, 'linear')
doTweenAlpha('cargo', 'cargo', 0, 0.1, 'linear')
doTweenAlpha('cargo wall', 'cargo wall', 0, 0.1, 'linear')
doTweenAlpha('white', 'dad', 0, 0.1, 'linear')
doTweenAlpha('overlay', 'overlay', 0, 0.1, 'linear')
doTweenAlpha('red light', 'red light', 0.7, 0.1, 'linear')
doTweenAlpha('defeat', 'd', 0, 0.1, 'linear')
setProperty('healthBar.alpha', 0)
setProperty('healthBarBG.alpha', 0)
setProperty('iconP1.alpha', 0)
setProperty('iconP2.alpha', 0)
end
if curStep == 3920 then
setProperty('red light.alpha', 0)
setProperty('gf.alpha', 0)
setProperty('boyfriend.alpha', 0)
setProperty('red.alpha', 1)
end
if curStep == 3928 then
doTweenAlpha('hud', 'camHUD', 0, 0.1 , 'linear')
doTweenAlpha('red', 'red', 0, 1.5 , 'linear')
end
end