bufferedScrollSpeed = 1;
lastScrollSpeed = 1;
targetScrollSpeed = 1;
targetSpeedTime = 0;
isChangingSpeed = false;

function onCreate()
	bufferedScrollSpeed = getPropertyFromClass('PlayState', 'SONG.speed');
end

function onUpdate(elapsed)
	if isChangingSpeed then
		isSmaller = true;
		curScroll = getPropertyFromClass('PlayState', 'SONG.speed');
		if lastScrollSpeed < targetScrollSpeed then
			isSmaller = false;
		end

		preCalc = curScroll;
		valueToAdd = ((targetScrollSpeed - lastScrollSpeed) * elapsed) / targetSpeedTime;
		if isSmaller then
			curScroll = curScroll - valueToAdd;
			if curScroll <= targetScrollSpeed then
				isChangingSpeed = false;
			end
		else
			curScroll = curScroll + valueToAdd;
			if curScroll >= targetScrollSpeed then
				isChangingSpeed = false;
			end
		end
		setPropertyFromClass('PlayState', 'SONG.speed', curScroll);

		--scaleMult = (curScroll / preCalc);
		--rescaleSustains(scaleMult);
	end
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Scroll Speed Change" then
		target = 0;
		time = 0;
		if not (value1 == '') then
			target = tonumber(value1);
		end
		if not (value2 == '') then
			time = tonumber(value2);
		end

		if target == getPropertyFromClass('PlayState', 'SONG.speed') then
			isChangingSpeed = false;
		else
			if time <= 0 then
				setPropertyFromClass('PlayState', 'SONG.speed', target);
			else
				isChangingSpeed = true;
				targetScrollSpeed = target;
				targetSpeedTime = time;
				lastScrollSpeed = getPropertyFromClass('PlayState', 'SONG.speed');
			end
		end
	end
end

-- resets value when you restart song/go into chart editor
function onDestroy()
	setPropertyFromClass('PlayState', 'SONG.speed', bufferedScrollSpeed);
end

-- for non kade sustains
function rescaleSustains(scaleMult)
	for i = 0, getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes', i, 'isSustainNote') --[[and not isEndNote(getPropertyFromGroup('notes', i, 'animation.curAnim.name'))]] then
			scaleY = getPropertyFromGroup('notes', i, 'scale.y');
			setPropertyFromGroup('notes', i, 'scale.y', scaleY * scaleMult);
		end
	end
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') --[[and not isEndNote(getPropertyFromGroup('unspawnNotes', i, 'animation.curAnim.name'))]] then
			scaleY = getPropertyFromGroup('unspawnNotes', i, 'scale.y');
			setPropertyFromGroup('unspawnNotes', i, 'scale.y', scaleY * scaleMult);
		end
	end
end

--[[function isEndNote(animName)
	if animName == 'purpleholdend' or animName == 'blueholdend' or animName == 'greenholdend' or animName == 'redholdend' then
		return true;
	end
	return false;
end]]