local bopType = 'none'
local bopPattern = {}
local bopLength = 0
local intensity = 1

function onEvent(n,v1,v2)
	if n == "Cam Bop Pattern" then
		val1 = stringSplit(v1, ',');
		bopType = val1[1] or 'none';
		bopLength = tonumber(val1[2]) or 0;
		intensity = 0.015 * (tonumber(val1[3]) or 0);
		bopPattern = {}
		rawPattern = stringSplit(v2, ',');
		for i=1, #rawPattern do
			bopPattern[i] = tonumber(rawPattern[i]) or 0
		end
	end
end

function onStepHit()
	if bopType == 'step' then bopCheck(curStep) end
end
function onBeatHit()
	if bopType == 'beat' then bopCheck(curBeat) end
end
function onSectionHit()
	if bopType == 'measure' then bopCheck(curSection) end
end

function bopCheck(current)
	if bopLength <= 0 or #bopPattern <= 0 then return end
	for i=1, #bopPattern do
		if current % bopLength == bopPattern[i] then
			triggerEvent("Add Camera Zoom",intensity, intensity * 2);
			break;
		end
	end
end