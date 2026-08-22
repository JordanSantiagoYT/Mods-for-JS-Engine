ogZoom = 1

enabled = true
function onCreatePost()
	ogZoom = getProperty('defaultCamZoom')
	jsVersionSplit = stringSplit(jsVersion, '.')
	if not (#jsVersionSplit < 1 or tonumber(jsVersionSplit[2]) < 51 and not stringEndsWith(jsVersionSplit[3], 'nightly1')) then
		enabled = false;
	end
end

zoomToDo = 1
function onEvent(name,value1,value2)
    if name == "Set Cam Zoom" and enabled then
		if value1 == 'default' then
			zoomToDo = ogZoom;
		else zoomToDo = tonumber(value1)
		end

	setProperty("defaultCamZoom", zoomToDo)
	if not value2 == '' then
		setProperty("camGame.zoom", zoomToDo) 
	end
    end
end