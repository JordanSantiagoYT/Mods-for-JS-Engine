function onEvent(n, value1, value2)
	if n == 'Force Camera Target' then
		if value1 == '0' or value1 == 'bf' or value1 == 'boyfriend' or value1 == '' then
			cameraSetTarget('bf');
		end
		if value1 == '1' or value1 == 'dad' or value1 == 'opponent' then
			cameraSetTarget('dad');
		end
	end
end