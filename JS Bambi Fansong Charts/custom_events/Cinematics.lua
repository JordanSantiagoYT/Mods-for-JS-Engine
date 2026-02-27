-- Created by RamenDominoes
start = 0
finish = 0

function onCreate()
	--THE TOP BAR
	makeLuaSprite('UpperBar', '', 0, -120)
	makeGraphic('UpperBar', 1920, 120, '000000')
	setObjectCamera('UpperBar', 'hud')
	addLuaSprite('UpperBar', false)
	--THE BOTTOM BAR
	makeLuaSprite('LowerBar', '', 0, 720)
	makeGraphic('LowerBar', 1920, 240, '000000')
	setObjectCamera('LowerBar', 'hud')
	addLuaSprite('LowerBar', false)
end

local ds = false
local duration = 3
function onEvent(name,value1,value2)
	if name == 'Cinematics' then
 		ds = downscroll or Vertscroll and true or false
		if string.find(value1, ',') then
			val1Split = stringSplit(value1, ',');
			start = tonumber(val1Split[1]);
			duration = val1Split[2];
			if duration == nil then
				duration = 3;
			end
		else start = tonumber(value1);
		end
		if string.find(value2, ',') then
			val2Split = stringSplit(value2, ',');
			finish = tonumber(val2Split[1]);
			duration = val2Split[2];
			if duration == nil then
				duration = 3;
			end
		else finish = tonumber(value2);
		end

		if start == 1 then
			doTweenY('Cinematics1', 'UpperBar', (ds and -50 or 0), duration, 'expoOut')
			doTweenY('Cinematics2', 'LowerBar', (ds and 650 or 600), duration, 'expoOut')
			for i=0, getProperty('strumLineNotes.length')-1 do
				noteTweenY('NOTEMOVE'..i, i, (ds and 520 or 120), duration, 'expoOut')
			end	
			doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 1)
			doTweenAlpha('AlphaTween2', 'healthBar', 0, 1)
			doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 1)
			doTweenAlpha('AlphaTween4', 'iconP1', 0, 1)
			doTweenAlpha('AlphaTween5', 'iconP2', 0, 1)
			doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.25)
			doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.25)
			doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.25)
			doTweenAlpha('AlphaTween9', 'healthTxt', 0, 0.25)

			for i = 0, getProperty('strumLineNotes.length')-1 do
				noteTweenAlpha('byeNote'..i, i, 0.7, duration, 'expoOut');
			end
		end
		if finish == 2 then
			doTweenY('Cinematics1', 'UpperBar', -120, duration, 'expoOut')
			doTweenY('Cinematics2', 'LowerBar', 720, duration, 'expoOut')
			for i=0, getProperty('strumLineNotes.length')-1 do
				noteTweenY('NOTEMOVE'..i, i, (ds and 570 or 50), duration, 'expoOut')
			end	
			doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 1)
			doTweenAlpha('AlphaTween2', 'healthBar', 1, 1)
			doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 1)
			doTweenAlpha('AlphaTween4', 'iconP1', 1, 1)
			doTweenAlpha('AlphaTween5', 'iconP2', 1, 1)
			doTweenAlpha('AlphaTween6', 'timeBar', 1, 0.25)
			doTweenAlpha('AlphaTween7', 'timeBarBG', 1, 0.25)
			doTweenAlpha('AlphaTween8', 'timeTxt', 1, 0.25)
			doTweenAlpha('AlphaTween9', 'healthTxt', 1, 0.25)

			for i = 0, getProperty('strumLineNotes.length')-1 do
				noteTweenAlpha('backNote'..i, i, 1, duration, 'expoOut');
			end
		end
	end
end