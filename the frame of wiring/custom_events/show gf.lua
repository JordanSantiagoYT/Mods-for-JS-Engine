local time = 5;

function onEvent(name, value1, value2)
	if name == 'show gf' then
		print('running boi')
		setProperty('phoneGuy.x', getProperty('gf.x') + 750)
		setProperty('phoneGuy.y', getProperty('gf.y') + 750)
		setProperty('phoneGuy.alpha', 0)
		scaleObject('phoneGuy', 0.1, 0.1)

		doTweenY('movingPhoneGuy', 'phoneGuy', getProperty('gf.y') + 500, time, 'quadInOut')
		doTweenY('PhoneGuyScaleY', 'phoneGuy.scale', 0.5, time, 'quadInOut')
		doTweenX('PhoneGuyScaleX', 'phoneGuy.scale', 0.5, time, 'quadInOut')
		doTweenAlpha('movingPhoneGuy', 'phoneGuy', 1, time, 'quadInOut')

		setProperty('phoneGuy.visible', true)
	end
end