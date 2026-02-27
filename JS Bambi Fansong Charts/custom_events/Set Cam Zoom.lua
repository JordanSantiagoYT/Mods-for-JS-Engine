ogZoom = 1

function onCreatePost()
	ogZoom = getProperty('defaultCamZoom')
end

zoomToDo = 1
function onEvent(name,value1,value2)
    if name == "Set Cam Zoom" then
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