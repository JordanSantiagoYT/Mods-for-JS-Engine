function onMoveCamera(focus)
	if dadName == 'gatewayJeremy' then
		if focus == 'boyfriend' then
			setProperty('defaultCamZoom', 0.6)
		elseif focus == 'dad' then
			setProperty('defaultCamZoom', 0.6)
		end
	end
	if dadName == 'gatewayNeptune' then
		if focus == 'boyfriend' then
			setProperty('defaultCamZoom', 0.8)
		elseif focus == 'dad' then
			setProperty('defaultCamZoom', 0.4)
		end
	end
	if dadName == 'gatewayTrueTime' then
		if focus == 'boyfriend' then
			setProperty('defaultCamZoom', 0.8)
		elseif focus == 'dad' then
			setProperty('defaultCamZoom', 0.5)
		end
	end
	if dadName == 'gatewayConbiG' then
		if focus == 'boyfriend' then
			setProperty('defaultCamZoom', 0.8)
		elseif focus == 'dad' then
			setProperty('defaultCamZoom', 0.3)
		end
	end
end

