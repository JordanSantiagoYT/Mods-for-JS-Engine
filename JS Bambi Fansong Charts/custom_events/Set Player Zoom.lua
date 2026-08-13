targetZooms = { boyfriend = 0, dad = 0, gf = 0 }

function onEvent(n, value1, value2)
	if n == 'Set Player Zoom' then
		val2 = stringSplit(value2, ',');
		targetZooms.boyfriend = tonumber(value1) or 0
		targetZooms.dad = tonumber(val2[1]) or 0
		targetZooms.gf = tonumber(val2[2]) or 0
		setZoom(gfSection, mustHitSection)
	end
	if n == 'Force Camera Target' then
		setZoom((value2 == 'gf' or value2 == '2'), (value1 == '0' or value1 == 'bf' or value1 == 'boyfriend'))
	end
end

function setZoom(isGF, isBF)
	local char = 'dad'

	if isGF then
		char = 'gf'
	elseif isBF then
		char = 'boyfriend'
	end

	if targetZooms[char] > 0 then
		setProperty('defaultCamZoom', targetZooms[char])
	end
end

function onSectionHit()
	setZoom(gfSection, mustHitSection)
end