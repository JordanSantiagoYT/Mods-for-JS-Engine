function onEvent(name, value1, value2)
	if name == 'Break Window' then
		print('broke window lol')
		setProperty('bg.visible', false)
		setProperty('bgWindow.visible', false)
		setProperty('bgWindowBroken.visible', true)
		setProperty('phoneGuy.visible', false)
		setProperty('gf.visible', true)
	end
end