--lmao i stole this script from vs 900n1

unfair = false;

function noteMiss(id, direction, noteType, isSustainNote)
	if getProperty('health') > 0.1 then
		setProperty('health', getProperty('health')+0.02);
		if unfair == true then
			setProperty('health', getProperty('health')+0.1);
		if getProperty('health') > 2.4 then
		if unfair == true then
			unfair = false;
		end
		end
		end
	else
		setProperty('health', getProperty('health')+0.1);
		if unfair == false then
			setPropertyFromClass('PlayState','deathCounter',(getPropertyFromClass('PlayState', 'deathCounter') * 1.2) + 1);
			unfair = true;
		end
	end
end
