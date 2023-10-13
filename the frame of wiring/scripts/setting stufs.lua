local gappleSongs = {'Disruption', 'Applecore', 'Wireframe', 'Ferocious', 'Apple-Leak', 'OG', 'badcorn', 'Kooky'};
local gappleHUD = {'Maze', 'Disruption', 'Applecore', 'Wireframe', 'Ferocious', 'Apple-Leak', 'OG', 'badcorn', 'Kooky'};

function onCreate()
	addHaxeLibrary('Application', 'lime.app')
	addHaxeLibrary('System', 'openfl.system')
	clearCache();
end

function onCreatePost()
	if getProperty('boyfriend.antialiasing') == true then --no point if antialiasing is off
		setProperty('boyfriend.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'));
	end

	if getProperty('dad.antialiasing') == true then --no point if antialiasing is off
		setProperty('dad.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'));
	end

	if getProperty('gf.antialiasing') == true then --no point if antialiasing is off
		setProperty('gf.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'));
	end

	if songName == 'Maze' then
		runHaxeCode[[
			Application.current.window.title = "Friday Night Funkin' | VS. Dave and Bambi 3.0b";
		]]
	end

	for i = 1, #gappleSongs do
		if songName == gappleSongs[i] then
			runHaxeCode[[
				Application.current.window.title = 'Vs Dave and Bambi: Golden Apple';
			]]
		end
	end


	if songName == 'lore' then
		runHaxeCode[[
			Application.current.window.title = "Friday Night Funkin' D-Sides";
		]]
	end

	if songName == 'Close Chuckle' then
		runHaxeCode[[
			Application.current.window.title = "Hotline 024";
		]]
	end
end

function onUpdate()
	--[[
	if getProperty('boyfriend.antialiasing') == true then --no point if antialiasing is off
		setProperty('boyfriend.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'));
	end
	
	if getProperty('dad.antialiasing') == true then --no point if antialiasing is off
		setProperty('dad.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'));
	end
	
	if getProperty('gf.antialiasing') == true then --no point if antialiasing is off
		setProperty('gf.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'));
	end
	
	for i = 0, 4, 1 do --actually causes framerate drop + not needed
		if getPropertyFromGroup('playerStrums', i, 'antialiasing') == true then --no point if antialiasing is off
			setPropertyFromGroup('playerStrums', i, 'antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
			playerDones[i] = true;
		end

		if getPropertyFromGroup('opponentStrums', i, 'antialiasing') == true then --no point if antialiasing is off
			setPropertyFromGroup('opponentStrums', i, 'antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
			opponentDones[i] = true;
		end
	end

	for i = 0, getProperty('notes.length') -1 do
		if getPropertyFromGroup('notes', i, 'antialiasing') == true then --no point if antialiasing is off
			setPropertyFromGroup('notes', i, 'antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
		end
	end

	for i = 0, getProperty('unspawnNotes.length') -1 do
		if getPropertyFromGroup('unspawnNotes', i, 'antialiasing') == true then --no point if antialiasing is off
			setPropertyFromGroup('unspawnNotes', i, 'antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
		end
	end
	--]]
end

function onEvent(tag, val1, val2)
	if tag == 'Change Character' then
		if getProperty('boyfriend.antialiasing') == true then --no point if antialiasing is off
			setProperty('boyfriend.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'));
		end
	
		if getProperty('dad.antialiasing') == true then --no point if antialiasing is off
			setProperty('dad.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'));
		end
	
		if getProperty('gf.antialiasing') == true then --no point if antialiasing is off
			setProperty('gf.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'));
		end
	end
end

function onEndSong()
	clearCache();
end

function onDestroy()
	clearCache();
end

function clearCache()
	runHaxeCode([[
		openfl.system.System.gc();
	]])
	runHaxeCode[[
		Application.current.window.title = "Friday Night Funkin': Psych Engine";
	]]
end