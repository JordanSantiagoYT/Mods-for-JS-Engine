function onMoveCamera(focus)
	if curSection < 63 or (curSection >= 128 and curSection < 239) or (curSection >= 336 and curSection < 623) or (curSection >= 751) then return end

	if focus == 'boyfriend' then
		setProperty('defaultCamZoom', 0.9)
	elseif focus == 'dad' then
		setProperty('defaultCamZoom', 0.6)
	end
end

