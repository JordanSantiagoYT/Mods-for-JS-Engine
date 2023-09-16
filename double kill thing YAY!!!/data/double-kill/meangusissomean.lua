characterPath = 'characters/meangus' -- Picture File name of spreadsheet (must have .xml)
characterTag = 'MeanMungus' -- Set this to what the sprite should be named.

noteNames = {
    'Red Mungus Note', -- Change this to whatever your note is named in path "custom_notetypes".
    'ALL Opps Note', -- Change this to whatever your note is named in path "custom_notetypes".
    'Half 1 Opps Note', -- Change this to whatever your note is named in path "custom_notetypes".
}

isDanceIdle = true -- If false, character sprite will use animation 'danceLeft' and 'danceRight'
flipX = true -- If true, flips character.
objectOrder = 7 -- Normally, values over 7 go over GF (7), Dad (8) and BF (9). (Default: 9)
haveMissAnimations = false -- If true, it will add the miss animations for the character sprite to use.
singAnimationLength = 4 -- How many steps until it goes back to idle.
danceEveryNumBeats = 2 -- Sets which per beat will the character dance on.
gfSpeed = 2 -- How many beats until danceLeft and danceRight dances. (If isDanceIdle is false.)
characterFPS = 24 -- Default is 24, how many frames should the animation play?
skipDance = false -- If true, it skips (stops) the dance on beat for the sprite.

extraSection = false -- If true, camera will point to what is put in characterCamera offset positions.
animSuffix = '' -- If this variable is set as '-alt', it will play alt animations. (Animation suffixes)

antialiasing = true -- If true, it will use antialiasing for the sprite which makes it more detailed.

idleSuffix = '' -- Change this to either have alternative idle animations if you have them added in the animations list.
heyTimer = 0 -- Adding in the future!
specialAnim = false -- Adding in the future! [Don't touch!]

singIndices = false -- If true, it will create sing animations using indices instead of prefixes. (You have to put the indices yourself.)

animNames = {
    'idle',
    'idle-alt',

    'singLEFT', -- singLEFT
    'singDOWN', -- singDOWN
    'singUP', -- singUP
    'singRIGHT', -- singRIGHT

    'singLEFT-alt', -- singLEFT (ALT)
    'singDOWN-alt', -- singDOWN (ALT)
    'singUP-alt', -- singUP (ALT)
    'singRIGHT-alt', -- singRIGHT (ALT)

    'singLEFTmiss', -- singLEFT (MISS)
    'singDOWNmiss', -- singDOWN (MISS)
    'singUPmiss', -- singUP (MISS)
    'singRIGHTmiss', -- singRIGHT (MISS)

    'danceLeft',
    'danceRight',

    'cheer',
    'hey'
}

singAnimations = {
    'singLEFT', -- Left
    'singDOWN', -- Down
    'singUP', -- Up
    'singRIGHT' -- Right
}

animPrefixes = {
    'idle', -- Idle
    'idle', -- Idle

    'right', -- Left
    'down', -- Down
    'up', -- Up
    'left', -- Right

    'right', -- Left
    'down', -- Down
    'up', -- Up
    'left', -- Right

    'BF NOTE LEFT MISS', -- Left (MISS)
    'BF NOTE DOWN MISS', -- Down (MISS)
    'BF NOTE UP MISS', -- Up (MISS)
    'BF NOTE RIGHT MISS', -- Right (MISS)

    'idle', -- Dance LEFT (Indices if needed.)
    'idle' -- Dance RIGHT (Indices if needed.)
}

characterAnimIndices = {
    '15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29', -- Dance RIGHT Indices.
    '0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14', -- Dance LEFT Indices.

    '0, 0, 0, 0, 0', -- Left (Change this if you're gonna set 'singIndices' to true.)
    '0, 0, 0, 0, 0', -- Down (Change this if you're gonna set 'singIndices' to true.)
    '0, 0, 0, 0, 0', -- Up (Change this if you're gonna set 'singIndices' to true.)
    '0, 0, 0, 0, 0' -- Right (Change this if you're gonna set 'singIndices' to true.)
}

characterPos = {
    660, -- X of character
    1000 -- Y of character
}

characterCamera = {
    0, -- X (Offset) for the camera to be targetting when it is extra characters turn.
    0 -- Y (Offset) for the camera to be targetting when it is extra characters turn.
}

characterScales = {
    1.3, -- Scale X of character
    1.3 -- Scale Y of character
}

characterOffsets = {
    50, 50, -- Idle
    50, 50, -- Idle

    174, 50, -- Left
    74, 23, -- Down
    169, 69, -- Up
    -8, 54, -- Right

    174, 50, -- Left
    74, 23, -- Down
    169, 69, -- Up
    -8, 54, -- Right -- i have to do this AGAIN so that when red hits an all opps note he doesnt slide all over the place

    5, -6, -- Left (MISS)
    -20, -51, -- Down (MISS)
    -46, 27, -- Up (MISS)
    -48, -7, -- Right (MISS)

    0, 0, -- DanceRIGHT
    0, 0 -- DanceLEFT
}

local noteFileCreation = false -- Creates note files incase note files for the character doesn't exist. (Enable if you don't know how to literally create files!)
local eventFileCreation = false -- Creates event files incase event files for the character doesn't exist. (Enable if you don't know how to literally create files!)

local wentIntoChart = false -- A bool if the user has went into chart editor.
function createCharacter(tag)
    characterName = tag

    for notes = 1, #noteNames do
        if not checkFileExists(currentModDirectory .. '/custom_notetypes/' .. noteNames[notes] .. '.lua') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_notetypes/' .. noteNames[notes] .. '.lua') and noteFileCreation then
            saveFile(currentModDirectory .. '/custom_notetypes/' .. noteNames[notes] .. '.lua', '')
        elseif not checkFileExists(currentModDirectory .. '/custom_notetypes/' .. noteNames[notes] .. '.lua') and not checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_notetypes/' .. noteNames[notes] .. '.lua') and noteFileCreation then
            saveFile('/custom_notetypes/' .. noteNames[notes] .. '.lua', '')
        end
    end

    if not checkFileExists(currentModDirectory .. '/custom_events/' .. tag .. ' Camera Section' .. '.txt') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_events/' .. tag .. ' Camera Section' .. '.txt') and eventFileCreation then
        saveFile(currentModDirectory .. '/custom_events/' .. tag .. ' Camera Section' .. '.txt', 'Disable/Enable camera section for ' .. tag .. '\n\nValue 1: Enable camera section for ' .. tag .. '\n[0 or 1 = False/True]\n\n(Works when camera moves/next section is hit!)')
    elseif not checkFileExists(currentModDirectory .. '/custom_events/' .. tag .. ' Idle ALT' .. '.txt') and not checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_events/' .. tag .. ' Camera Section' .. '.txt') and eventFileCreation then
        saveFile('/custom_events/' .. tag .. ' Camera Section' .. '.txt', 'Disable/Enable camera section for ' .. tag .. '\n\nValue 1: Enable camera section for ' .. tag .. '\n[0 or 1 = False/True]\n\n(Works when camera moves/next section is hit!)')
    end

    if not checkFileExists(currentModDirectory .. '/custom_events/' .. tag .. ' Idle ALT' .. '.txt') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_events/' .. tag .. ' Idle ALT' .. '.txt') and eventFileCreation then
        saveFile(currentModDirectory .. '/custom_events/' .. tag .. ' Idle ALT' .. '.txt', 'Changes idle animation to the alt idle animation.\n\nValue 1: Suffix for idle alt animation.')
    elseif not checkFileExists(currentModDirectory .. '/custom_events/' .. tag .. ' Idle ALT' .. '.txt') and not checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and not checkFileExists('/custom_events/' .. tag .. ' Idle ALT' .. '.txt') and eventFileCreation then
        saveFile('/custom_events/' .. tag .. ' Idle ALT' .. '.txt', 'Changes idle animation to the alt idle animation.\n\nValue 1: Suffix for idle alt animation.')
    end

    makeAnimatedLuaSprite(tag, characterPath, characterPos[1], characterPos[2]);

    local animOffsetters = {1, 2} --// Deal with it 
    for i = 1, #characterOffsets do
        addAnimationByPrefix(tag, animNames[i], animPrefixes[i], characterFPS, false); -- After it hits its animation limit, it will continue to add more animations even though theres none? (Maybe)
        addOffset(tag, animNames[i], characterOffsets[animOffsetters[1]], characterOffsets[animOffsetters[2]]);

        animOffsetters[1] = animOffsetters[1] + 2
        animOffsetters[2] = animOffsetters[2] + 2
    end

    setProperty(tag .. '.flipX', flipX);
    setProperty(tag .. '.antialiasing', antialiasing)
    scaleObject(tag, characterScales[1], characterScales[2]);

    setObjectOrder(tag, objectOrder);

    addLuaSprite(tag, false); -- Set this to true if you want it to be in front of other sprites. (You can also use object order to set where the sprite should overlap.)

    setProperty(tag .. '.offset.x', characterOffsets[1]) -- Fix offsets when created.
    setProperty(tag .. '.offset.y', characterOffsets[2]) -- Fix offsets when created.
end

function onCreate()
    luaDebugMode = false

    createCharacter(characterTag);
end
function onCreatePost()
    setProperty('MeanMungus.alpha', 0);
end


function onSongStart()
doTweenAlpha('sdsff', 'MeanMungus', 1, 1, 'linear')
end
function onStepHit()
if curStep == 3391 then
doTweenAlpha('whyfdf', 'MeanMungus', 0, 0.1, 'linear')
end
if curStep == 3920 then
doTweenAlpha('dige', 'MeanMungus', 0, 0.1, 'linear')
end
if curStep == 1431 then
doTweenAlpha('dfhfdd', 'MeanMungus', 0, 1, 'linear')
end
if curStep == 1685 then
doTweenAlpha('gdfghfdgsd', 'MeanMungus', 1, 0.1, 'linear')
end
end

function onSpawnNote(membersIndex, noteData, noteType, isSustainNote)
    for names = 1, #noteNames do
        if noteType == noteNames[names] then
            setPropertyFromGroup('unspawnNotes', membersIndex, 'noAnimation', false); -- Make it so original character doesn't sing these notes
            setPropertyFromGroup('unspawnNotes', membersIndex, 'noMissAnimation', true); -- Make it so original character doesn't miss
	end
	if noteType == 'Red Mungus Note' then
		setPropertyFromGroup('unspawnNotes', membersIndex, 'noAnimation', true);
	end
    end
end

local holdTimer = 0 -- For onUpdate, don't touch this variable!

local danced = false -- Has the character danced for GF? (Works a bit differently than in Psych Engine?)

function onBeatHit()
    if isDanceIdle then
        if curBeat % danceEveryNumBeats == 0 and not skipDance and not stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then
            dance()
            --holdTimer = 0
        end

    elseif not isDanceIdle then -- I did this differently than in Psych Engine. However, this works!
        if danced and not skipDance and curBeat % gfSpeed == 0 and not stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then -- no stepCrochet?
            dance()
            --holdTimer = 0

        elseif not danced and not skipDance and curBeat % gfSpeed == 0 and not stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then -- no stepCrochet?
            dance()
            --holdTimer = 0
        end
    end
end

function onUpdate(elapsed)
    if stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') then
        holdTimer = holdTimer + elapsed
    end

    if flipX then 
        if holdTimer >= getPropertyFromClass('Conductor', 'stepCrochet') * (0.0011 / getPropertyFromClass('flixel.FlxG', 'sound.music.pitch')) * singAnimationLength then
            dance()
            holdTimer = 0
        end

    else
        if holdTimer > getPropertyFromClass('Conductor', 'stepCrochet') * (0.0011 / getPropertyFromClass('flixel.FlxG', 'sound.music.pitch')) * singAnimationLength and stringStartsWith(getProperty(characterName .. '.animation.curAnim.name'), 'sing') and not stringEndsWith(getProperty(characterName .. '.animation.curAnim.name'), 'miss') then
            dance()
        end
    end

    if stringEndsWith(getProperty(characterName .. '.animation.curAnim.name'), 'miss') and getProperty(characterName .. '.animation.curAnim.finished') then
        playAnim(characterName, animNames[1] .. idleSuffix, true, false, 10)
    end

    if getProperty(characterName .. '.animation.curAnim.finished') and stringEndsWith(getProperty(characterName .. '.animation.curAnim.name'), '-loop') then
        playAnim(characterName, getProperty(characterName .. '.animation.curAnim.name') .. '-loop')
    end

    --// Unrelated animation character stuff //--
    if keyboardJustPressed('SEVEN') and not wentIntoChart then
        wentIntoChart = true
    end
end

function onMoveCamera(character)
    if extraSection then
        setProperty('camFollow.x', getMidpointX(characterName) - 100 - characterCamera[1])
        setProperty('camFollow.y', getMidpointY(characterName) - 100 + characterCamera[2])
    end
end

function onCountdownStarted()
    runTimer('startCharacterTimer', getPropertyFromClass('Conductor', 'crochet') / 1000 / playbackRate, 5) -- lol (will a loop of 5 be an issue?)
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote) 
    for names = 1, #noteNames do
    if noteType == noteNames[names] then
        animSuffix = ''
        playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
        holdTimer = 0
    end
    end
	if noteType == noteNames[1] and not isDanceIdle then
        --playAnim(characterName, animNames[noteData + 2], true); -- uhhh is this needed?
        animSuffix = ''

        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
            danced = true
        elseif getProperty(characterName .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
            danced = false
        end

        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterName .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
            if not danced then
                danced = true
            else
                danced = false
            end
        end
    end

    if noteType == noteNames[22] then
        animSuffix = '-alt'
        playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
        holdTimer = 0
    
    elseif noteType == noteNames[22] and not isDanceIdle then
        animSuffix = '-alt'
        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
            danced = true
        elseif getProperty(characterName .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
            danced = false
        end

        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterName .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
            if not danced then
                danced = true
            else
                danced = false
            end
        end
    end

    for extraNotes = 3, #noteNames do -- 3? more like doing manual guessing!!!
        if noteType == noteNames[extraNotes] then
            animSuffix = ''
            playAnim(characterName, tostring(stringSplit(noteNames[extraNotes], '-')[2]), true);
            holdTimer = 0
        end
    end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote) 
    if noteType == noteNames[1] then
        animSuffix = ''
        playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
        holdTimer = 0

    elseif noteType == noteNames[1] and not isDanceIdle then
        --playAnim(characterName, animNames[noteData + 2], true); -- uhhh is this needed?
        animSuffix = ''

        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
            danced = true
        elseif getProperty(characterName .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
            danced = false
        end

        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterName .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
            if not danced then
                danced = true
            else
                danced = false
            end
        end
    end

    if noteType == noteNames[2] then
        animSuffix = '-alt'
        playAnim(characterName, singAnimations[noteData + 1] .. animSuffix, true);
        holdTimer = 0
    
    elseif noteType == noteNames[2] and not isDanceIdle then
        animSuffix = '-alt'
        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[1] .. animSuffix then
            danced = true
        elseif getProperty(characterName .. '.animation.curAnim.name') == singAnimations[2] .. animSuffix then
            danced = false
        end

        if getProperty(characterName .. '.animation.curAnim.name') == singAnimations[3] .. animSuffix or getProperty(characterName .. '.animation.curAnim.name') == singAnimations[4] .. animSuffix then
            if not danced then
                danced = true
            else
                danced = false
            end
        end
    end

    for extraNotes = 3, #noteNames do -- 3? more like doing manual guessing!!!
        if noteType == noteNames[extraNotes] then
            animSuffix = ''
            playAnim(characterName, tostring(stringSplit(noteNames[extraNotes], '-')[2]), true);
            holdTimer = 0
        end
    end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if noteType == noteNames[1] and haveMissAnimations then
        playAnim(characterName, singAnimations[noteData + 1] .. 'miss' .. animSuffix, true)
        --recalculateDanceIdle()
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startCharacterTimer' then
        if isDanceIdle and luaSpriteExists(characterName) and loopsLeft % danceEveryNumBeats == 0 and getProperty(characterName .. '.animation.curAnim') then
            dance()

        elseif not isDanceIdle and luaSpriteExists(characterName) and loopsLeft % gfSpeed == 0 and getProperty(characterName .. '.animation.curAnim') then -- gfSpeed and not round(gfSpeed * danceEveryNumBeats)? lol
            dance()
        end
    end
end

function onEvent(eventName, value1, value2)
    if eventName == characterName .. ' Idle ALT' or eventName == 'Extr. Idle ALT' then
        if value1 then
            idleSuffix = value1
        else
            idleSuffix = ''
        end
    end

    if eventName == characterName .. ' Camera Section' or eventName == 'Extr. Camera Section' then
        if value1 == '1' then
            extraSection = true
        elseif value1 == '0' then
            extraSection = false
        end
    end
end


function onDestroy()
    if not wentIntoChart and not inChartEditor then
        for notes = 3, #noteNames do -- Seperate main and ALT files.
            if checkFileExists(currentModDirectory .. '/custom_notetypes/' .. noteNames[notes] .. '.lua') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and noteFileCreation then
                deleteFile(currentModDirectory .. '/custom_notetypes/' .. noteNames[notes] .. '.lua')
            elseif checkFileExists('/custom_notetypes/' .. noteNames[notes] .. '.lua') and checkFileExists(stringSplit(scriptName, 'mods/')[2]) and noteFileCreation then
                deleteFile('/custom_notetypes/' .. noteNames[notes] .. '.lua')
            end
        end

        if checkFileExists(currentModDirectory .. '/custom_events/' .. characterName .. ' Camera Section' .. '.txt') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and eventFileCreation then
            deleteFile(currentModDirectory .. '/custom_events/' .. characterName .. ' Camera Section' .. '.txt')
        elseif checkFileExists('/custom_events/' .. characterName .. ' Camera Section' .. '.txt') and checkFileExists(stringSplit(scriptName, 'mods/')[2]) and eventFileCreation then
            deleteFile('/custom_events/' .. characterName .. ' Camera Section' .. '.txt')
        end

        if checkFileExists(currentModDirectory .. '/custom_events/' .. characterName .. ' Idle ALT' .. '.txt') and checkFileExists(currentModDirectory .. stringSplit(scriptName, 'mods/')[2]) and eventFileCreation then
            deleteFile(currentModDirectory .. '/custom_events/' .. characterName .. ' Idle ALT' .. '.txt')
        elseif checkFileExists('/custom_events/' .. characterName .. ' Idle ALT' .. '.txt') and checkFileExists(stringSplit(scriptName, 'mods/')[2]) and eventFileCreation then
            deleteFile('/custom_events/' .. characterName .. ' Idle ALT' .. '.txt')
        end
    end
end

local settingCharacterUp = true
function recalculateDanceIdle() -- Does settingCharacterUp & lastDance variable be needed for this? (Psych Engine does this but it seems to be fine without it? I don't know.)
    local lastDanceIdle = isDanceIdle
    isDanceIdle = (getProperty(characterName .. '.animation.curAnim.name') == animNames[15] .. idleSuffix and getProperty(characterName .. '.animation.curAnim.name') == animNames[16] .. idleSuffix)

    if settingCharacterUp then
        danceEveryNumBeats = (isDanceIdle == 1 and 1 or 2) -- isDanceIdle == 1 or 2?
    elseif not lastDanceIdle == isDanceIdle then
        local danceEveryNumBeatsCalc = danceEveryNumBeats

        if not isDanceIdle then
            danceEveryNumBeatsCalc = danceEveryNumBeatsCalc / 2
        else
            danceEveryNumBeatsCalc = danceEveryNumBeatsCalc * 2
    
            danceEveryNumBeats = round(math.max(danceEveryNumBeatsCalc, 1)) 
            --debugPrint('Round handled: ' .. danceEveryNumBeats)
        end
        settingCharacterUp = false
    end
end

function dance()
    if not skipDance and not specialAnim then
        if not isDanceIdle then

            if not danced then
                danced = true
            else
                danced = false
            end

            if danced then -- no stepCrochet?
                playAnim(characterName, animNames[16] .. idleSuffix, true);
                holdTimer = 0
    
            elseif not danced then -- no stepCrochet?
                playAnim(characterName, animNames[15] .. idleSuffix, true);
                holdTimer = 0
            end

        elseif isDanceIdle then
            playAnim(characterName, animNames[1] .. idleSuffix, false);
        end
    end
end


-- http://lua-users.org/wiki/SimpleRound -- Second code.
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function setCharacterVar(variable, input)
    setGlobalFromScript(scriptName, variable, input)
end

function getCharacterVar(variable)
    getGlobalFromScript(scriptName, variable)
end

--[[ 
    Highest is first priority!
    TODOS: 
        1: If idleSuffix is '-alt' on character creation, it will force play animation. (Fix this?)
--]]
