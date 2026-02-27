--[[
Made by 💜 Rodney, Imaginative Person 💙#5286 and JasonTheOne111#0529 (Fun Fact: Jason doesn't remember working on this at all lmao)
Cleaned up and fixed by Superpowers#3887
Heatlthbar movement by The Shade Lord#9206
Version Checker by raltyro#1324
]]--

-- false is up and side, true is down and middle
local Vertical, Horizontal = downscroll, middlescroll
local StrumSwap, ignoreMiddle, targetAlpha = false, true, {0.5, 'player'}

local hscriptExists = true
local chartingMode
local scrollTypeTesting
local pbRate = (playbackRate == nil and 1 or playbackRate) --? I don't fuckin know.
local keyAmount = {4, 4}

local ifBotOnStart = false
function onCreatePost()
	Vertical, Horizontal = downscroll, middlescroll
	setOnLuas('VertScroll', Vertical)
	setOnLuas('HoriScroll', Horizontal)
	setOnLuas('StrumState', StrumSwap)
	local strumNoMidcoolIG = (Horizontal and not ignoreMiddle or StrumSwap)
	setOnLuas('StrumNoMid', strumNoMidcoolIG)
	
	-- keyCount = (keyCount == nil and 4 or keyCount)
	-- keyAmount = {keyCount, keyCount}

	chartingMode = getPropertyFromClass('PlayState', 'chartingMode')
	--~ playbackRate didn't exist until 0.6.3 so here's a null check!
	if (not compareVersion(getVersion(), '0.6.3')) then
		if chartingMode then debugPrint('Uhh playbackRate doesn\'t exist yet.') end
		pbRate = (playbackRate == nil and 1 or playbackRate)
	end
	--! Will stop hscript functions in 0.6.2 from working to prevent crashes on older version's.
	if (not compareVersion(getVersion(), '0.6.1')) then
		if chartingMode then debugPrint('You will not have cool hscript coolness!') end
		hscriptExists = false
	end
	--! Won't work right since noteTweenDirection didn't exist yet!
	if (not compareVersion(getVersion(), '0.5.2')) then
		debugPrint('You need version 0.5.2 or higher! Cause of this the swapping up and down scrolltype won\'t work!')
		return close(false)
	end
	
	luaDebugMode, scrollTypeTesting = chartingMode, chartingMode
	if scrollTypeTesting then
		labelStuff(false)
		labelStuff(true)
	end
	ntdFIX(false)
end

local keyForThing = {
	{keyAmount[1] - keyAmount[1], keyAmount[2] - 1},
	{keyAmount[2], (keyAmount[2] - 1) + keyAmount[2]},
	{keyAmount[2] - keyAmount[1], ((keyAmount[2] - 1) + keyAmount[2]) - keyAmount[1]}
}

function onUpdate()
	--[[debugPrint('Player: '..defaultPlayerStrumX0..', ', defaultPlayerStrumX1..', ', defaultPlayerStrumX2..', ', defaultPlayerStrumX3..' and ', defaultPlayerStrumY0)
	debugPrint('Opponent: '..defaultOpponentStrumX0..', ', defaultOpponentStrumX1..', ', defaultOpponentStrumX2..', ', defaultOpponentStrumX3..' and ', defaultOpponentStrumY0)]]

	if scrollTypeTesting then --& Presepctive off of player strums!
		if keyboardJustPressed('LEFT') then
			if keyboardPressed('SHIFT') then
				triggerEvent('ChaSrlTyp~ Strum Swap', 'on')
				triggerEvent('Change Scrolltype', '', 'off')
			else
				triggerEvent('Change Scrolltype', '', (StrumSwap and 'off' or 'on'))
			end
		elseif keyboardJustPressed('RIGHT') then
			if keyboardPressed('SHIFT') then
				triggerEvent('ChaSrlTyp~ Strum Swap', 'off')
				triggerEvent('Change Scrolltype', '', 'off')
			else
				triggerEvent('Change Scrolltype', '', (StrumSwap and 'on' or 'off'))
			end
		end

		if keyboardJustPressed('DOWN') then
			triggerEvent('Change Scrolltype', 'on')
		elseif keyboardJustPressed('UP') then
			triggerEvent('Change Scrolltype', 'off')
		end

		if keyboardJustPressed('SPACE') then
			triggerEvent('ChaSrlTyp~ Strum Swap', 'swap')
		end
		if keyboardJustPressed('TAB') then
			ignoreMiddle = not ignoreMiddle
		end
	end

	pbRate = (playbackRate == nil and 1 or playbackRate)
	--[[keyAmount, keyForThing = {keyCount, keyCount}, {
		{keyAmount[1] - keyAmount[1], keyAmount[2] - 1},
		{keyAmount[2], (keyAmount[2] - 1) + keyAmount[2]},
		{keyAmount[2] - keyAmount[1], ((keyAmount[2] - 1) + keyAmount[2]) - keyAmount[1]}
	}]]
end
function onUpdatePost() ntdFIX(true) end

function toboolean(str)
	-- maru thx
	local bool = false
	bool = (tostring(str):lower() == 'true' and true or false)
	return bool
end

local autoSwapVertical, bpmCheckforASV = {false, false}, 4 -- ASV stands for autoSwapVertical
local autoSwapHorizontal = false
function onBeatHit()
	bpmCheckforASV = (curBpm >= 160 and 8 or 4)
	if autoSwapVertical[1] then
		if curBeat % bpmCheckforASV == 0 then
			if autoSwapVertical[2] then triggerEvent('ChaSrlTyp~ Tween Typing', 'backInOut, 0.3', 'Vert') end
			triggerEvent('Change Scrolltype', 'swap')
		end
	end
end

function onSectionHit()	if autoSwapHorizontal then triggerEvent('Change Scrolltype', (mustHitSection and 'on' or 'off')) end end

local defEase, defDuration = 'quadOut', 0.5
local curEaseVert, curDurationVert = defEase, defDuration
local curEaseHori, curDurationHori = defEase, defDuration

-- Will change soon...
local leftSide, rightSide = {92, 204, 316, 428}, {732, 844, 956, 1068}
local splitWay, middleWay = {82, 194, 971, 1083}, {412, 524, 636, 748}
function onEvent(name, value1, value2)
	if name == 'Change Scrolltype' then
		--! Vertical Scrolltypes
		if value1 == 'off' or value1 == 'on' then --^ Switch Between Upscroll and Downscroll
			Vertical = (value1 == 'on')
			changeScrolltype(false)
		elseif value1 == 'swap' then --~ Swap between Up and Downscroll
			Vertical = not Vertical
			changeScrolltype(false)
		elseif value1 == 'default' then -- Switch Back to Default Scrolltype
			Vertical = downscroll
			changeScrolltype(false)
		elseif value1 == 'anti' then -- Switch to the opposite of Default Scrolltype
			Vertical = not downscroll
			changeScrolltype(false)
		elseif value1 == 'current' then -- Current (never telling you this exists)
			changeScrolltype(false)

		elseif value1 == 'very unfunny' then --& Weird Shit, it's cool
			autoSwapVertical[1] = true
			autoSwapVertical[2] = true
		elseif value1 == 'unfunny' then
			autoSwapVertical[1] = true
			autoSwapVertical[2] = false
		elseif value1 == 'funny' then
			autoSwapVertical[1] = false
			autoSwapVertical[2] = false
			triggerEvent('Change Scrolltype', 'default')
		end
		
		--! Horizontal Scrolltypes
		if value2 == 'off' or value2 == 'on' then --^ Switch Between Sidescroll and Middlescroll
			Horizontal = (value2 == 'on')
			changeScrolltype(true)
		elseif value2 == 'swap' then --~ Swap between Up and Middlescroll
			Horizontal = not Horizontal
			changeScrolltype(true)
		elseif value2 == 'default' then -- Switch Back to Default Scrolltype
			Horizontal = middlescroll
			changeScrolltype(true)
		elseif value2 == 'anti' then -- Switch to the opposite of Default Scrolltype
			Horizontal = not middlescroll
			changeScrolltype(true)
		elseif value2 == 'current' then -- Current (never telling you this exists)
			changeScrolltype(true)
			
		elseif value2 == 'unfunny' then --& Weird Shit, it's cool
			autoSwapHorizontal = true
			if chartingMode then addLuaText('sectionTxt') end
		elseif value2 == 'funny' then
			autoSwapHorizontal = false
			if chartingMode then removeLuaText('sectionTxt', false) end
			triggerEvent('Change Scrolltype', 'default')
		end
		if scrollTypeTesting then labelStuff(true) end
	end

	if name == 'ChaSrlTyp~ Tween Typing' then
		local tweeningContents = {}
		if string.find(value1, ',') then
			tweeningContents = Split(value1, ',')
			TweenTyping(tweeningContents[1], tweeningContents[2], value2)
		else
			TweenTyping(value1, value2, 'Both')
		end
	end

	if name == 'ChaSrlTyp~ Tween Typing Defaults' then
		local tweeningContents = {}
		if string.find(value1, ',') then
			tweeningContents = Split(value1, ',')
			TweenTyping(tweeningContents[1], tweeningContents[2], value2, true)
		else
			TweenTyping(value1, value2, 'Both', true)
		end
	end

	if name == 'ChaSrlTyp~ Strum Swap' then
		local strumContents = {v1 = {}, v2 = {}}
		strumContents.v1 = Split(value1, ',')
		strumContents.v2 = Split(value2, ',')

		if strumContents.v1[1] == 'off' or strumContents.v1[1] == 'on' then
			StrumSwap = (strumContents.v1[1] == 'on')
		elseif strumContents.v1[1] == 'swap' then
			StrumSwap = not StrumSwap
		end
		
		if strumContents.v1[2] == 'off' or strumContents.v1[2] == 'on' then
			ignoreMiddle = (strumContents.v1[2] == 'on')
		elseif strumContents.v1[2] == 'swap' then
			ignoreMiddle = not ignoreMiddle
		end

		--TODO Weird Shit... soon I promise
		
		if strumContents.v2[1] == 'both' then
			targetAlpha[2] = 'both'
		elseif strumContents.v2[1] == 'opponent' then
			targetAlpha[2] = 'opponent'
		elseif strumContents.v2[1] == 'player' then
			targetAlpha[2] = 'player'
		end
		if scrollTypeTesting then labelStuff(true) end
	end
end

---@param ease string
---@param duration number
---@param direction string
function TweenTyping(ease, duration, direction, newDefaults)
	ease = ((ease == nil or ease == '') and defEase or tostring(ease))
	duration = (duration == nil and defDuration or tonumber(duration))
	direction = ((direction == nil or direction == '') and 'Both' or tostring(direction))

	if newDefaults then
		defEase = (#ease < 1 and 'quadOut' or tostring(ease))
		defDuration = (duration == nil and '0.5' or tonumber(duration))
	end

	if direction == 'Both' then
		curEaseVert = ease
		curDurationVert = duration
		curEaseHori = ease
		curDurationHori = duration
	elseif direction == 'Vert' then
		curEaseVert = ease
		curDurationVert = duration
	elseif direction == 'Hori' then
		curEaseHori = ease
		curDurationHori = duration
	end
end

local function resetDefaultStrumX(mustPress, arrayStor)
	local check = (mustPress and 3 or 1)
	for i = keyForThing[check][1], keyForThing[check][2] do
		setOnLuas('default' .. ((mustPress and 'Player' or 'Opponent')) .. 'StrumX' .. i, arrayStor[i+1])
	end
end

function changeScrolltype(scrolltype)
	-- Up and Downscroll
	if scrolltype == false then
		setOnLuas('VertScroll', Vertical)

		setProperty('healthBar.y', (Vertical and 83.2 or 644.8))
		setProperty('timeBar.y', (Vertical and 688 or 31))
		setProperty('iconP1.y', getProperty('healthBar.y') - 75)
		setProperty('iconP2.y', getProperty('healthBar.y') - 75)
		setProperty('scoreTxt.y', getProperty('healthBar.y') + 25)
		setProperty('timeTxt.y', getProperty('timeBar.y') - 12)
		setProperty('botplayTxt.y', (Vertical and 606 or 82))
		callOnLuas('ChaSrlTyp_onUpdateHud', {Vertical, Horizontal, StrumSwap, ignoreMiddle}, false, true, {scriptName})
		
		for i = keyForThing[1][1], keyForThing[1][2] do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', Vertical)
			noteTweenDirection('scrollDir' .. i, i, (downscroll and (Vertical and 90 or -90) or (Vertical and -90 or 90)), curDurationVert / pbRate, curEaseVert)
			noteTweenY('moveNoteY' .. i, i, (Vertical and screenHeight - 150 or 50), curDurationVert / pbRate, curEaseVert)
		end
		for i = keyForThing[2][1], keyForThing[2][2] do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', Vertical)
			noteTweenDirection('scrollDir' .. i, i, (downscroll and (Vertical and 90 or -90) or (Vertical and -90 or 90)), curDurationVert / pbRate, curEaseVert)
			noteTweenY('moveNoteY' .. i, i, (Vertical and screenHeight - 150 or 50), curDurationVert / pbRate, curEaseVert)
		end
		
		for i = keyForThing[1][1], keyForThing[1][2] do
			setOnLuas('defaultOpponentStrumY' .. i, (Vertical and screenHeight - 150 or 50))
		end
		for i = keyForThing[3][1], keyForThing[3][2] do
			setOnLuas('defaultPlayerStrumY' .. i, (Vertical and screenHeight - 150 or 50))
		end
		
		curEaseVert = defEase
		curDurationVert = defDuration
	end
		
	-- Side and Middlescroll
	if scrolltype == true and (keyAmount[1] == 4 and keyAmount[2] == 4) then
		setOnLuas('HoriScroll', Horizontal)
		setOnLuas('StrumState', StrumSwap)
		local strumNoMidcoolIG = (Horizontal and not ignoreMiddle or StrumSwap)
		setOnLuas('StrumNoMid', strumNoMidcoolIG)

		if Horizontal then
			for i = keyForThing[1][1], keyForThing[1][2] do
				noteTweenX('moveNoteX' .. i, i, (ignoreMiddle and splitWay or (StrumSwap and middleWay or splitWay))[i+1], curDurationHori / pbRate, curEaseHori)
				noteTweenAlpha('alphaNote' .. i, i, (targetAlpha[2] ~= 'opponent' and targetAlpha[1] or 1), curDurationHori / pbRate, curEaseHori)
				resetDefaultStrumX(false, (ignoreMiddle and splitWay or (StrumSwap and middleWay or splitWay)))
			end
			
			for i = keyForThing[2][1], keyForThing[2][2] do
				noteTweenX('moveNoteX' .. i, i, (ignoreMiddle and middleWay or (StrumSwap and splitWay or middleWay))[i-3], curDurationHori / pbRate, curEaseHori)
				noteTweenAlpha('alphaNote' .. i, i, (targetAlpha[2] ~= 'player' and targetAlpha[1] or 1), curDurationHori / pbRate, curEaseHori)
				resetDefaultStrumX(true, (ignoreMiddle and middleWay or (StrumSwap and splitWay or middleWay)))
			end
		else
			for i = keyForThing[1][1], keyForThing[1][2] do
				noteTweenX('moveNoteX' .. i, i, (StrumSwap and rightSide or leftSide)[i+1], curDurationHori / pbRate, curEaseHori)
				noteTweenAlpha('alphaNote' .. i, i, 1, curDurationHori / pbRate, curEaseHori)
				resetDefaultStrumX(false, (StrumSwap and rightSide or leftSide))
			end
			
			for i = keyForThing[2][1], keyForThing[2][2] do
				noteTweenX('moveNoteX' .. i, i, (StrumSwap and leftSide or rightSide)[i-3], curDurationHori / pbRate, curEaseHori)
				noteTweenAlpha('alphaNote' .. i, i, 1, curDurationHori / pbRate, curEaseHori)
				resetDefaultStrumX(true, (StrumSwap and leftSide or rightSide))
			end
		end

		curEaseHori = defEase
		curDurationHori = defDuration
	end
end

function labelStuff(doing)
	if doing == false then
		local ycord = 270
		-- Label's to see Defaults
		makeLuaText('defaultsTxt', 'Default\'s: ' .. (downscroll and 'Downscroll' or 'Upscroll') .. ' and ' .. (middlescroll and 'Middlescroll' or 'Sidescroll'), nil, 40, ycord)
		setTextSize('defaultsTxt', 24)
		addLuaText('defaultsTxt')
		
		-- Cool, shitty title
		makeLuaText('titleorsmthTxt', 'Current Scrolltypes', nil, 80, ycord + 30)
		setTextSize('titleorsmthTxt', 34)
		addLuaText('titleorsmthTxt')
		
		-- Vertical Label
		makeLuaText('vertTxt', 'Downscroll: ' .. (Vertical and 'On' or 'Off'), nil, 57, ycord + 60)
		setTextSize('vertTxt', 48)
		addLuaText('vertTxt')
		
		-- Horizontal Label
		makeLuaText('horiTxt', 'Middlescroll: ' .. (Horizontal and 'On' or 'Off'), nil, 57, ycord + 110)
		setTextSize('horiTxt', 48)
		addLuaText('horiTxt')
		
		-- Strum Label
		makeLuaText('strumsTxt', 'Strums Swapped: ' .. (StrumSwap and 'On' or 'Off'), nil, 57, ycord + 160)
		setTextSize('strumsTxt', 48)
		addLuaText('strumsTxt')
		makeLuaText('ignoreMidTxt', 'Ignore Middlescroll: ' .. (ignoreMiddle and 'On' or 'Off'), nil, 57, ycord + 210)
		setTextSize('ignoreMidTxt', 48)
		addLuaText('ignoreMidTxt')

		-- Section Label
		makeLuaText('sectionTxt', 'Section: ' .. (gfSection and 'Girlfriend' or mustHitSection and 'Player' or 'Opponent'), nil, 57, ycord + 260)
		setTextSize('sectionTxt', 48)
	else
		setTextString('defaultsTxt', 'Default\'s: ' .. (downscroll and 'Downscroll' or 'Upscroll') .. ' and ' .. (middlescroll and 'Middlescroll' or 'Sidescroll'))
		setTextString('vertTxt', 'Downscroll: ' .. (Vertical and 'On' or 'Off'))
		setTextString('horiTxt', 'Middlescroll: ' .. (Horizontal and 'On' or 'Off'))
		setTextString('strumsTxt', 'Strums Swapped: ' .. (StrumSwap and 'On' or 'Off'))
		setTextString('ignoreMidTxt', 'Ignore Middlescroll: ' .. (ignoreMiddle and 'On' or 'Off'))
		setTextString('sectionTxt', 'Section: ' .. (gfSection and 'Girlfriend' or mustHitSection and 'Player' or 'Opponent'))
		
		if lowQuality == false then
			local color = {
				bf = {'31b0d1', '00657f'},
				dad = {'af66ce', '652b7d'},
				gf = {'a5004d', '65002f'},
				notes = {
					{'c24b99', '00ffff', '12fa05', 'f9393f'},
					{'761855', '009c9c', '079900', '980004'}
				}
			}
			--~ #stupid #unneeded #dontcare #ratio
			setTextColor('vertTxt',                    (Vertical and color.notes[1][2] or color.notes[1][3]))
			setTextColor('horiTxt',                    (Horizontal and color.notes[1][1] or color.notes[1][4]))
			setTextColor('strumsTxt',                  (StrumSwap and color.dad[1] or color.bf[1]))
			setTextColor('ignoreMidTxt',               (ignoreMiddle and color.notes[1][3] or color.notes[1][4]))
			setTextColor('sectionTxt',                 (gfSection and color.gf[1] or (mustHitSection and color.bf[1] or color.dad[1])))
			setProperty('vertTxt.borderColor',         getColorFromHex(Vertical and color.notes[2][2] or color.notes[2][3]))
			setProperty('horiTxt.borderColor',         getColorFromHex(Horizontal and color.notes[2][1] or color.notes[2][4]))
			setProperty('strumsTxt.borderColor',       getColorFromHex(StrumSwap and color.dad[2] or color.bf[2]))
			setProperty('ignoreMidTxt.borderColor',    getColorFromHex(ignoreMiddle and color.notes[2][3] or color.notes[2][4]))
			setProperty('sectionTxt.borderColor',      getColorFromHex(gfSection and color.gf[2] or (mustHitSection and color.bf[2] or color.dad[2])))
			-- This does kinda help with the persepctive I refer to with botplay!
		end
	end
end

--! Mayo78#7878 YOU'RE THE BEST, HOLY SHIT!
function setOnLuas(varName, valueInput)
	if hscriptExists then
		if not setOnLuas_init then --makes the var holder
			setOnLuas_init = true
			runHaxeCode('setVar("setOnLuas_varHolder", null);')
		end
		setProperty('setOnLuas_varHolder', {varName, valueInput}) --sets the temp shit
		--actually set the whatever
		runHaxeCode("game.setOnLuas(getVar('setOnLuas_varHolder')[0], getVar('setOnLuas_varHolder')[1]);")
		setProperty('setOnLuas_varHolder', nil) --go away DIE DIE DIE!!!!!!!!
		--if its onCreate then it doesnt work because the lua file wouldn't be in the luaArray yet
		if _G[varName] == nil then _G[varName] = valueInput end
	end
end

--? Cool helpful array thingy by Unholywanderer04#1468
function Split(s, delimiter)
	local result = {}
	s = tostring(s)
	for match in (s..delimiter):gmatch('(.-)'..delimiter) do
		table.insert(result, tostring(stringTrim(match)))
	end
	return result
end

--^ Version Stuff by raltyro#1324
function getVersion()
	return version or getPropertyFromClass('MainMenuState', 'psychEngineVersion') or '0.0.0'
end

function getVersionLetter(ver) -- ex '0.5.2h' > 'h'
	local str = ''
	string.gsub(ver, '%a+', function(e)
		str = str .. e
	end)
	return str
end

function getVersionNumber(ver) -- ex '0.6.1' > 61
	local str = ''
	string.gsub(ver, '%d+', function(e)
		str = str .. e
	end)
	return tonumber(str)
end

function getVersionBase(ver) -- ex '0.5.2h' > '0.5.2'
	local letter, str = getVersionLetter(ver)
	if (letter == '') then return ver end
	for s in ver:gmatch('([^'..letter..']+)') do
		str = str .. s
	end
	return str
end

function compareVersion(ver, needed)
	local a, b = getVersionLetter(ver), getVersionLetter(needed)
	local c, d = getVersionNumber(ver), getVersionNumber(needed)
	local v = true
	if (c == d) then v = (b == '' or (a ~= '' and a:byte() >= b:byte())) end
	return c >= d and v
end

--! Shit here by methewhenmethe#7219 this is to fix the wierd visual issues with noteTweenDirection!
function ntdFIX(doing)
	if doing == false then
		if hscriptExists then
			addHaxeLibrary('FlxRect', 'flixel.math')
		end
	else
		for i = 0, getProperty('notes.length')-1 do
			local noteData = getPropertyFromGroup('notes', i, 'noteData')
			setPropertyFromGroup('notes', i, 'clipRect', nil)
			if (getPropertyFromGroup('notes', i, 'mustPress')) and (getPropertyFromGroup('notes', i, 'isSustainNote')) then
				setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('playerStrums', noteData, 'direction') - 90)
			elseif (getPropertyFromGroup('notes', i, 'isSustainNote')) then
				setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('opponentStrums', noteData, 'direction') - 90)
			end
			if (noteData >= 4) and (not getPropertyFromGroup('notes', i, 'isSustainNote')) then
				setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('playerStrums', noteData, 'angle'))
			elseif (not getPropertyFromGroup('notes', i, 'isSustainNote')) then
				setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('opponentStrums', noteData, 'angle'))
			end
		end
		if hscriptExists then
			if downscroll then
				runHaxeCode([[
					game.notes.forEachAlive(function(daNote) {
						
						if(daNote.distance > 0 && daNote.wasGoodHit)
						{
							strumGroup = game.playerStrums;
							if(!daNote.mustPress) strumGroup = game.opponentStrums;
							strumY = strumGroup.members[daNote.noteData].y - (daNote.swagWidth / 2);
							swagRect = new FlxRect(0, 0, daNote.frameWidth, daNote.frameHeight);
							swagRect.height = (50 + (-daNote.distance)) / daNote.scale.y;
							swagRect.y = daNote.frameHeight - swagRect.height; 

							daNote.clipRect = swagRect;
							//trace(swagRect);
						}
					});
				]])
			else
				runHaxeCode([[
					game.notes.forEachAlive(function(daNote) {

						if(daNote.distance < 0 && daNote.wasGoodHit)
						{
							strumGroup = game.playerStrums;
							if(!daNote.mustPress) strumGroup = game.opponentStrums;
							strumY = strumGroup.members[daNote.noteData].y + (daNote.swagWidth / 2);
							swagRect = new FlxRect(0, 0, daNote.width / daNote.scale.x, daNote.height / daNote.scale.y);
							swagRect.y = (50 - daNote.distance) / daNote.scale.y;
							swagRect.height -= swagRect.y;

							daNote.clipRect = swagRect;
							//trace(swagRect);
						}
					});
				]])
			end
		end
	end
end