function onCreatePost()
	jsVerSplit = stringSplit(jsVersion, '.');
	if #jsVerSplit > 0 and tonumber(jsVerSplit[2]) > 20 and tonumber(jsVerSplit[2]) < 45 then --Version is between 1.21.0 and 1.44.2
		triggerEvent('Popup', "Chart Not Supported", "Unfortunately, due to how EK works in this song, this chart is incompatible with your version of JS Engine.\nTo play it, please update to 1.45.0.\n\nA 4K chart will be made soon!")
		endSong()
	end
end
function onMoveCamera(focus)
	if focus == 'boyfriend' then
		setProperty('defaultCamZoom', 0.7)
	elseif focus == 'dad' then
		setProperty('defaultCamZoom', 0.2)
	end
end

