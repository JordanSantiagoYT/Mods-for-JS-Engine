function onCreate()
	makeLuaSprite('schoolStatic', 'garrettSchool/normal', -400, 50);
	scaleObject('schoolStatic', 2.4, 2.4)
	addLuaSprite('schoolStatic', false);
	setProperty('schoolStatic.antialiasing', false)

	makeLuaSprite('scarySchool', 'garrettSchool/SCARY', -400, 50);
	scaleObject('scarySchool', 2.4, 2.4)
	addLuaSprite('scarySchool', false);
	setProperty('scarySchool.alpha', 0)
	setProperty('scarySchool.antialiasing', false)
end

function onStepHit()
	if curStep == 1 then
		setProperty('scarySchool.alpha', 0)
		setProperty('schoolStatic.alpha', 1)
	end
	if curStep == 1536 then
		setProperty('scarySchool.alpha', 1)
	end
end