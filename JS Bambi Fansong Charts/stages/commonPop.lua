function onCreate()
	makeLuaSprite('bg', 'commonBG/gradient', -500, -300);
	scaleObject('bg', 2.2, 2.2);
   	setScrollFactor('bg', 0, 0);
	addLuaSprite('bg', false);

	makeLuaSprite('platyay', 'commonBG/genericplatyay', -150, 200);
	setScrollFactor('platyay', 1, 1);
	scaleObject('platyay', 2.5, 2.5);
	addLuaSprite('platyay', false)
	setProperty('platyay.alpha', 0)

	makeLuaSprite('plat', 'commonBG/genericplat', -400, 250);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 2.5, 2.5);
	addLuaSprite('plat', false)

	makeLuaSprite('overlay', 'commonBG/drugs', -900, -700);
	setScrollFactor('overlay', 0, 0);
	scaleObject('overlay', 2.5, 2.5);
	addLuaSprite('overlay', false)
	addGlitchEffect('overlay', 2, 5, 0.1);
	setObjectOrder('overlay', 20)
end

function onStepHit()
	if curStep == 0 then
		setProperty('platyay.alpha', 0)
		setProperty('plat.alpha', 1)
	end
	if curStep == 1280 then
		setProperty('platyay.alpha', 1)
		setProperty('plat.alpha', 0)
	end
end