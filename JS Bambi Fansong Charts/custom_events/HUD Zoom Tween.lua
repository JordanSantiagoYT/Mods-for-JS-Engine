function onEvent(name,value1,value2)
	luaDebugMode = true
    if name == "HUD Zoom Tween" then
	val1 = tonumber(value1);
	val2Split = stringSplit(value2, ',');
	val2 = tonumber(val2Split[1]);
	ease = val2Split[2];
	if ease == nil then
		ease = 'linear';
	end

	doTweenZoom("hudZoom", "camHUD", 1 + val1, val2, ease)
    end
end