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
function onUpdate()
	if start == 1 then
	doTweenY('Cinematics1', 'UpperBar', 0, 0.5, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 600, 0.5, 'Linear')
	for i=0, getProperty('strumLineNotes.length')-1 do
		noteTweenY('NOTEMOVE'..i, i, 120, 0.5, 'Linear')
	end	
	doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.25)
	doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.25)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.25)
	doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.25)
	doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.25)
	doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.25)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.25)
	doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.25)
	doTweenAlpha('AlphaTween9', 'healthTxt', 0, 0.25)

		for i = 0, getProperty('strumLineNotes.length')-1 do
			noteTweenAlpha('byeNote'..i, i, 0.7, 0.5, 'linear');
		end
	end

	if downscroll and start == 1 then
	doTweenY('Cinematics1', 'UpperBar', -50, 0.5, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 650, 0.5, 'Linear')
	for i=0, getProperty('strumLineNotes.length')-1 do
		noteTweenY('NOTEMOVE'..i, i, 120, 0.5, 'Linear')
	end	
	doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.25)
	doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.25)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.25)
	doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.25)
	doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.25)
	doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.25)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.25)
	doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.25)
	doTweenAlpha('AlphaTween9', 'healthTxt', 0, 0.25)
	end

	if finish == 2 then
	doTweenY('Cinematics1', 'UpperBar', -120, 0.5, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 720, 0.5, 'Linear')
	for i=0, getProperty('strumLineNotes.length')-1 do
		noteTweenY('NOTEMOVE'..i, i, 50, 0.5, 'Linear')
	end	
	doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.25)
	doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.25)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.25)
	doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.25)
	doTweenAlpha('AlphaTween5', 'iconP2', 1, 0.25)
	doTweenAlpha('AlphaTween6', 'timeBar', 1, 0.25)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 1, 0.25)
	doTweenAlpha('AlphaTween8', 'timeTxt', 1, 0.25)
	doTweenAlpha('AlphaTween9', 'healthTxt', 1, 0.25)

		for i = 0, getProperty('strumLineNotes.length')-1 do
			noteTweenAlpha('byeNote'..i, i, 1, 0.5, 'linear');
		end
	end

	if downscroll and finish == 2 then
	doTweenY('Cinematics1', 'UpperBar', -120, 0.5, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 720, 0.5, 'Linear')
	for i=0, getProperty('strumLineNotes.length')-1 do
		noteTweenY('NOTEMOVE'..i, i, 570, 0.5, 'Linear')
	end	
	doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.25)
	doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.25)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.25)
	doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.25)
	doTweenAlpha('AlphaTween5', 'iconP2', 1, 0.25)
	doTweenAlpha('AlphaTween6', 'timeBar', 1, 0.25)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 1, 0.25)
	doTweenAlpha('AlphaTween8', 'timeTxt', 1, 0.25)
	doTweenAlpha('AlphaTween9', 'healthTxt', 1, 0.25)
	end
end

function onEvent(name,value1,value2)
	if name == 'Cinematics' then
		start = tonumber(value1)
		finish = tonumber(value2)
	end
end

