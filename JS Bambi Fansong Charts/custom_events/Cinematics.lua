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

function onEvent(name,value1,value2)
	if name == 'Cinematics' then
		start = tonumber(value1)
		finish = tonumber(value2)
		if start == 1 then
			doTweenY('Cinematics1', 'UpperBar', (downscroll and -50 or 0), 3, 'expoOut')
			doTweenY('Cinematics2', 'LowerBar', (downscroll and 650 or 600), 3, 'expoOut')
			for i=0, getProperty('strumLineNotes.length')-1 do
				noteTweenY('NOTEMOVE'..i, i, (downscroll and 520 or 120), 3, 'expoOut')
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
				noteTweenAlpha('byeNote'..i, i, 0.7, 3, 'expoOut');
			end
		end
		if finish == 2 then
			doTweenY('Cinematics1', 'UpperBar', -120, 3, 'expoOut')
			doTweenY('Cinematics2', 'LowerBar', 720, 3, 'expoOut')
			for i=0, getProperty('strumLineNotes.length')-1 do
				noteTweenY('NOTEMOVE'..i, i, (downscroll and 570 or 50), 3, 'expoOut')
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
				noteTweenAlpha('backNote'..i, i, 1, 3, 'expoOut');
			end
		end
	end
end

