function onCreate()
    addCharacterToList('bfScared', 'boyfriend')
    addCharacterToList('bfMildScared', 'boyfriend')
    addCharacterToList('bfVeryScared', 'boyfriend')
    addCharacterToList('bfTraumatized', 'boyfriend')
    addCharacterToList('bf', 'boyfriend')
end
function onEvent(name,value1,value2)
    if name == "Trigger Scared BF" then
	value1 = tonumber(value1);
	if value1 == 0 or value1 == '' then
		triggerEvent('Change Character', 0, 'bfScared')
	end
	if value1 == 1 then
		triggerEvent('Change Character', 0, 'bfMildScared')
	end
	if value1 == 2 then
		triggerEvent('Change Character', 0, 'bfVeryScared')
	end
	if value1 == 3 then
		triggerEvent('Change Character', 0, 'bfTraumatized')
	end
	if value1 == 4 then
		triggerEvent('Change Character', 0, 'bf')
	end
    end
end