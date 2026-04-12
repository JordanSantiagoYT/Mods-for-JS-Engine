function onEvent(name,value1,value2)
    if name == "Tween Camera Zoom" then
	val1 = tonumber(value1);
	val2Split = stringSplit(value2, ',');
	val2 = tonumber(val2Split[1]);
	ease = val2Split[2];
	if ease == nil then
		ease = 'linear';
	end

	doTweenZoom("camGameZoom", "camGame", val1, val2, ease)
	setProperty('defaultCamZoom', val1)
	runHaxeCode('setVar("zoomTweening", true);')
	runTimer('enableZoomSet', val2)
    end
end

function onTimerCompleted(tag)
	if tag == 'enableZoomSet' then
		runHaxeCode('setVar("zoomTweening", false);')
	end
end