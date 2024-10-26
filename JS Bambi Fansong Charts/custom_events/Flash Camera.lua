function onEvent(n,v1,v2)
	if n == 'Flash Camera' then
		val2Split = stringSplit(v2, ',');
		camera = val2Split[1];
		if camera == nil then
			camera = 'camOther';
		end
		color = val2Split[0];
		if color == nil then
			color = 'ffffff';
		end
		cameraFlash(camera, color, v1)
	end
end