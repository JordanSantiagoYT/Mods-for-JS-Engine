function onMoveCamera(focus)
	if dadName == 'wanderley-drop' then
		if focus == 'boyfriend' then
			setProperty('defaultCamZoom', 0.8)
		elseif focus == 'dad' then
			setProperty('defaultCamZoom', 0.6)
		end
	end
end