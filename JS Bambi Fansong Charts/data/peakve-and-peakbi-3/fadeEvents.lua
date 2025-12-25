function onCreatePost()
	luaDebugMode = true
	makeLuaText('Credits', "Peakve and Peakbi 3\n\nSong by NextGen\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	doMultiColors({getIconColor('gf'), getIconColor('dad')})

	for i=0, getProperty('unspawnNotes.length') - 1 do
		if getPropertyFromGroup('unspawnNotes', i, 'strumTime') >= 127230 then
			setPropertyFromGroup('unspawnNotes', i, 'multSpeed', 3);
		end
	end
end

function onStepHit()
	if curStep == 252 or curStep == 508 then
		cameraFade('camOther', 'ffffff', (50/curBpm), false, false)
	end
	if curStep == 256 then
		setProperty('peakbiIcon.alpha', 0)
		setProperty('bambiIcon.alpha', 1)
		cameraFade('camOther', 'ffffff', (50/curBpm), false, true)
		doMultiColors({getIconColor('gf'), getIconColor('dad')})
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 288 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep == 512 then
		setProperty('peakbiIcon.alpha', 1)
		removeLuaSprite('bambiIcon', true)
		doMultiColors({getIconColor('gf'), getIconColor('dad')})
		setProperty('ytWatermark.alpha', 0)
		cameraFade('camOther', 'ffffff', (50/curBpm), false, true)
	end
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function doMultiColors(colors)
	colorTable = {}
	for i=1, #colors do
		table.insert(colorTable, colors[i])
	end
	colorTable = turnArrayIntoString(colorTable)
	runHaxeCode([[
		function splitColors(colors:Dynamic):Array<Int>
		{
			var arr = [];
			var steps = game.healthBarBG.height / colors.length;

			for (col in colors)
				for (i in 0...steps)
					arr.push(col);

			return arr;
		}

		//put your health bar colors here.
		var colorArr = ]]..colorTable..[[;

		game.healthBar.createGradientBar(splitColors(colorArr), []]..getIconColor('boyfriend')..[[], 1, 90);
		game.healthBar.updateBar();
	]])
end

--lua arrays use {}, haxe arrays use [], converts them to be used with hscript
function turnArrayIntoString(arr)
    local str = '['
    for i, v in ipairs(arr) do 
        str = str.."" .. v .. ""  -- Add quotes for strings
        if i < #arr then
            str = str .. ", "  -- Add commas between elements
        end
    end
    str = str..']'
    return str
end