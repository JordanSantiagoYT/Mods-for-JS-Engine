function onEvent(name, value1, value2)
	if name == 'Character Y Pos' then
		print('new y heheheh')
		if value1 == 'dad' or value1 == getProperty('dad.curCharacter') then
			setProperty('dad.y', value2)
		end

		if value1 == 'bf' or value1 == 'boyfriend' or value1 == getProperty('boyfriend.curCharacter') then
			setProperty('boyfriend.y', value2)
		end
	end
end