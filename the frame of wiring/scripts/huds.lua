--DON'T STEAL KIDS!
--BY JUNIORNOVOA

local songSplashNames = {'Maze', 'Disruption', 'Applecore', 'Wireframe', 'Ferocious', 'Apple-Leak', 'OG', 'badcorn', 'Kooky'};
local oldFNFPos = {'Disruption', 'Applecore', 'Wireframe', 'Ferocious', 'Apple-Leak', 'OG', 'badcorn', 'Kooky'};
local gappleHUD = {'Maze', 'Disruption', 'Applecore', 'Wireframe', 'Ferocious', 'Apple-Leak', 'OG', 'badcorn', 'Kooky'};
local gappleHUDsong = false;
local arrowXoffset = 35;
local no_splashes = false;

       function roundDecimal(Value, Precision)
		local mult = 1
		for i = 0, Precision do
			mult = mult * 10

		return math.floor(Value * mult) / mult
	 end
	end

function onCreatePost()
	setProperty('showCombo', true)
	for i = 1, #songSplashNames do
		if songName == songSplashNames[i] then
			no_splashes = true;
		end
	end
	for i = 1, #oldFNFPos do
		if songName == oldFNFPos[i] then
			for direction = 0, 3 do
				setPropertyFromGroup('playerStrums', direction, 'x', getPropertyFromGroup('playerStrums', direction, 'x') - arrowXoffset)
				setPropertyFromGroup('opponentStrums', direction, 'x', getPropertyFromGroup('opponentStrums', direction, 'x') - arrowXoffset -5)
			end
		end
	end
	for i = 1, #gappleHUD do
		if songName == gappleHUD[i] then
			setTextFont('scoreTxt', 'comic.ttf')
			setTextFont('timeTxt', 'comic.ttf')

			makeLuaText('creditsWatermark', songName, 0, 4, getProperty('healthBarBG.y') + 30)
			setObjectCamera('creditsWatermark', 'camHUD')
			setTextAlignment('creditsWatermark', 'center')
			setTextFont('creditsWatermark', 'comic.ttf')
			setTextSize('creditsWatermark', 16)
			setTextBorder('creditsWatermark', 1.5, '000000')
			setProperty('creditsWatermark.antialiasing', false)
			updateHitbox('creditsWatermark')
			addLuaText('creditsWatermark')

			makeLuaText('creditsText', '', 0, 4, getProperty('healthBarBG.y') + 50)
			setObjectCamera('creditsText', 'camHUD')
			setTextAlignment('creditsText', 'center')
			setTextFont('creditsText', 'comic.ttf')
			setTextSize('creditsText', 16)
			setTextBorder('creditsText', 1.5, '000000')
			setProperty('creditsText.antialiasing', false)
			updateHitbox('creditsText')
			addLuaText('creditsText')

			if songName == 'Disruption' then
				setProperty('creditsText.text', 'Screw you!')
			end
			if getProperty('creditsText.text') == '' then
				setProperty('creditsWatermark.y', getProperty('healthBarBG.y') + 50)
			end
			if songName == 'Maze' then
				setProperty('healthBarBG.visible', false)
				makeLuaSprite('healthBarBGnew', 'daveHealth', getProperty('healthBarBG.x'), getProperty('healthBarBG.y'))
				setObjectCamera('healthBarBGnew', 'camHUD')
				addLuaSprite('healthBarBGnew', false)
				setObjectOrder('healthBarBGnew', getObjectOrder('healthBarBG') + 1)
	
				makeLuaSprite('iconP12', 'icons/missing', 0, 0)
				makeLuaSprite('iconP22', 'icons/missing', 0, 0)
				break;
			end

			makeLuaSprite('healthBarBGnew', 'healthBarOverlay', getProperty('healthBarBG.x'), getProperty('healthBarBG.y'))
			scaleObject('healthBarBGnew', getProperty('healthBarBG.scale.x') - 0.075, getProperty('healthBarBG.scale.y') - 0.15)
			setObjectCamera('healthBarBGnew', 'camHUD')
			addLuaSprite('healthBarBGnew', false)
			setObjectOrder('healthBarBGnew', getObjectOrder('healthBarBG') + 1)

			if songName == 'Kooky' then
				setProperty('healthBarBGnew.visible', false)
			end

			
			makeLuaSprite('iconP12', 'icons/missing', 0, 0)
			makeLuaSprite('iconP22', 'icons/missing', 0, 0)

			setProperty("updateTime", false)
			
			setObjectOrder('timeTxt', 99)
			gappleHUDsong = true;
		end
	end
end

--THANK GOD THE INTERNET EXISTS
function math.lerp(from, to, t)
	return from + (to - from) * math.clamp(t, 0, 1)
end
function math.clamp(x,min,max)return math.max(min,math.min(x,max))end
function string.duplicate(s, i)
    local str = ""
    for i = 1, i do str = str .. s end
    return str
end
string.dupe = string.duplicate
local zero = "0"
function math.toTime(x, includeMS, blankIfNotExist)
    local abs = math.abs(x)
    local int = math.floor(abs)
    
    local ms = tostring(abs - int):sub(2, 5)
    ms = ms .. zero:duplicate(math.floor(math.clamp(4 - #ms, 0, 3)))
    
    local s = tostring(math.fmod(int, 60))
    if (#s == 1) then s = zero .. s end
    
    local m = tostring(math.fmod(math.floor(int / 60), 60))
    if (#m == 1 and (blankIfNotExist or int >= 3600)) then m = zero .. m end
    
    local h = tostring(math.floor(int / 3600))
    
    local r = m .. ":" .. s
    if (int >= 3600) then r = h .. ":" .. r end
    
    return (x < 0 and "-" or "") .. (includeMS and r .. ms or r)
end
--NO MORE INTERNET NEEDED

function onUpdate()
	setProperty('healthBarBGnew.alpha', getProperty('healthBar.alpha'))
	if gappleHUDsong then
		setProperty('timeBarBG.visible', false)
		setProperty('timeBar.visible', false)
		local actualSongLength = math.toTime(getProperty("songLength") / 1000);
		local songPos = math.toTime(getSongPosition() / 1000)
		setTextString('timeTxt', songPos.." / "..actualSongLength)
	end
end

function onUpdatePost()
	if songName == 'Maze' or gappleHUDsong then
		setTextString('scoreTxt', "Score:"..tostring(score).." | Misses:"..tostring(getProperty('songMisses')).." | Accuracy:".. math.floor(rating*10000)/100 ..'%')
		if songName == 'Maze' then
			local thingy = 0.82;
			setGraphicSize('iconP22', math.floor(math.lerp(150, getProperty('iconP22.width'), thingy)), math.floor(math.lerp(150, getProperty('iconP22.height'), thingy)))
			setGraphicSize('iconP12', math.floor(math.lerp(150, getProperty('iconP12.width'), thingy)), math.floor(math.lerp(150, getProperty('iconP12.height'), thingy)))
			updateHitbox('iconP12')
			updateHitbox('iconP22')
			updateHitbox('iconP1')
			updateHitbox('iconP2')
		end
	end
end

function onStepHit()
	for i = 0, getProperty('notes.length') do --why doesn't psych do this already???
        for iStrum = 0, 3 do
            if getPropertyFromGroup('notes', i, 'mustPress') then
                setPropertyFromGroup('notes', i, 'scale.x', getPropertyFromGroup('playerStrums', getPropertyFromGroup('notes', i, 'noteData'), 'scale.x'))
				if getPropertyFromGroup('notes', i, 'isSustainNote') ~= true then
                	setPropertyFromGroup('notes', i, 'scale.y', getPropertyFromGroup('playerStrums', getPropertyFromGroup('notes', i, 'noteData'), 'scale.y'))
				end
				--[[if getPropertyFromGroup('notes', i, 'isSustainNote') and getPropertyFromGroup('notes', i, 'prevNote.isSustainNote') then
					setPropertyFromGroup('notes', i, 'scale.y', getPropertyFromGroup('playerStrums', getPropertyFromGroup('notes', i, 'noteData'), 'scale.y') * (crochet / 100 * 1.05) * getProperty('songSpeed'))
				end--]]
            else
                setPropertyFromGroup('notes', i, 'scale.x', getPropertyFromGroup('opponentStrums', getPropertyFromGroup('notes', i, 'noteData'), 'scale.x'))
				if getPropertyFromGroup('notes', i, 'isSustainNote') ~= true then
                	setPropertyFromGroup('notes', i, 'scale.y', getPropertyFromGroup('opponentStrums', getPropertyFromGroup('notes', i, 'noteData'), 'scale.y'))
				end
				--[[if getPropertyFromGroup('notes', i, 'isSustainNote') and getPropertyFromGroup('notes', i, 'prevNote.isSustainNote') then
					setPropertyFromGroup('notes', i, 'scale.y', getPropertyFromGroup('opponentStrums', getPropertyFromGroup('notes', i, 'noteData'), 'scale.y') * (crochet / 100 * 1.05) * getProperty('songSpeed'))
				end--]]
            end
        end
    end
end

function onSectionHit()
	if gappleHUDsong then
		cancelTween('timeTxtScaleX')
		cancelTween('timeTxtScaleY')
		setProperty('timeTxt.scale.x', 1.1)
		setProperty('timeTxt.scale.y', 1.1)
		doTweenX('timeTxtScaleX', 'timeTxt.scale', 1, 0.2)
		doTweenY('timeTxtScaleY', 'timeTxt.scale', 1, 0.2)
	end
end

function onBeatHit()
	if songName == 'Maze' then
		local funny = math.max(math.min(getProperty('healthBar.value'), 1.9), 0.1)
		setGraphicSize('iconP12', math.floor(getProperty('iconP12.width') + (50 * funny)), math.floor(getProperty('iconP12.height') - (25 * funny)))
		setGraphicSize('iconP22', math.floor(getProperty('iconP22.width') + (50 * ((2 - funny) + 0.1))), math.floor(getProperty('iconP22.height') - (25 * ((2 - funny) + 0.1))))

		updateHitbox('iconP12')
		updateHitbox('iconP22')
		updateHitbox('iconP1')
		updateHitbox('iconP2')
		iconScale()
	end

	if gappleHUDsong then
		if songName == 'Kooky' then
			return;
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if no_splashes then
		removeFromGroup('grpNoteSplashes', getProperty('grpNoteSplashes.length') -1, false); --insta killed
	end
end