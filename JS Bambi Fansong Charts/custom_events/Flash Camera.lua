function trim(s)
   return s:match("^%s*(.-)%s*$")
end

function onEvent(n,v1,v2)
	luaDebugMode = true
	if n == 'Flash Camera' then
		val2Split = stringSplit(v2, ',');
		camera = val2Split[2];
		if camera == nil then
			camera = 'camOther';
		end
		color = val2Split[1];
		if color == nil then
			color = 'ffffff';
		end
		cameraFlash(trim(camera), color, v1)
	end
end