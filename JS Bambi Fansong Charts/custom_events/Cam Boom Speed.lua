boomSpeed = 0
intensity = 0
offset = 0
function onEvent(n,v1,v2)
if n == "Cam Boom Speed" then
	boomSpeed = math.floor((tonumber(v1) or 0) * 4)
	val2Split = stringSplit(v2, ',');
	intensity = tonumber(val2Split[1]) or 0
	offset = stringTrim(val2Split[2]) or 0
end

end

function onStepHit()
	if boomSpeed > 0 and intensity > 0 and (curStep - (offset*4)) % boomSpeed == 0 then
		triggerEvent("Add Camera Zoom",0.015*intensity,0.03*intensity)
	end
end