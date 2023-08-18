local offsetAmount = 5;
local oldBFPosX = 0;
local oldBFPosY = 0;
local oldDADPosX = 0;
local oldDADPosY = 0;

local bfKeys = {'Z', 'X', 'COMMA', 'PERIOD'};
local dadKeys = {'A', 'S', 'W', 'D'};
local offsetMultiplier = 'SHIFT';
local canMoveBfOffsets = false;
local canMoveDadOffsets = false;

function onCreatePost()
	oldBFPosX = getProperty("boyfriend.x");
	oldBFPosY = getProperty("boyfriend.y");
	oldDADPosX = getProperty("dad.x");
	oldDADPosY = getProperty("dad.y");
end

function onUpdate()
	if getPropertyFromClass("flixel.FlxG","keys.justPressed."..offsetMultiplier) then
		offsetAmount = 10;
	end
	if getPropertyFromClass("flixel.FlxG","keys.justReleased."..offsetMultiplier) then
		offsetAmount = 5;
	end

	if getPropertyFromClass("flixel.FlxG","keys.justPressed."..bfKeys[1]) and canMoveBfOffsets then
		setProperty("boyfriend.x", getProperty("boyfriend.x") -offsetAmount);
		print('BFS POS X: '..getProperty("boyfriend.x")..', POS Y: '..getProperty("boyfriend.y")..', ORIGIN POS X: '..oldBFPosX..', ORIGIN POS Y: '..oldBFPosY)
	elseif getPropertyFromClass("flixel.FlxG","keys.justPressed."..bfKeys[2]) and canMoveBfOffsets then
		setProperty("boyfriend.y", getProperty("boyfriend.y") +offsetAmount);
		print('BFS POS X: '..getProperty("boyfriend.x")..', POS Y: '..getProperty("boyfriend.y")..', ORIGIN POS X: '..oldBFPosX..', ORIGIN POS Y: '..oldBFPosY)
	elseif getPropertyFromClass("flixel.FlxG","keys.justPressed."..bfKeys[3]) and canMoveBfOffsets then
		setProperty("boyfriend.y", getProperty("boyfriend.y") -offsetAmount);
		print('BFS POS X: '..getProperty("boyfriend.x")..', POS Y: '..getProperty("boyfriend.y")..', ORIGIN POS X: '..oldBFPosX..', ORIGIN POS Y: '..oldBFPosY)
	elseif getPropertyFromClass("flixel.FlxG","keys.justPressed."..bfKeys[4]) and canMoveBfOffsets then
		setProperty("boyfriend.x", getProperty("boyfriend.x") +offsetAmount);
		print('BFS POS X: '..getProperty("boyfriend.x")..', POS Y: '..getProperty("boyfriend.y")..', ORIGIN POS X: '..oldBFPosX..', ORIGIN POS Y: '..oldBFPosY)
	end

	if getPropertyFromClass("flixel.FlxG","keys.justPressed."..dadKeys[1]) and canMoveDadOffsets then
		setProperty("dad.x", getProperty("dad.x") -offsetAmount);
		print('DADS POS X: '..getProperty("dad.x")..', POS Y: '..getProperty("dad.y")..', ORIGIN POS X: '..oldDADPosX..', ORIGIN POS Y: '..oldDADPosY)
	elseif getPropertyFromClass("flixel.FlxG","keys.justPressed."..dadKeys[2]) and canMoveDadOffsets then
		setProperty("dad.y", getProperty("dad.y") +offsetAmount);
		print('DADS POS X: '..getProperty("dad.x")..', POS Y: '..getProperty("dad.y")..', ORIGIN POS X: '..oldDADPosX..', ORIGIN POS Y: '..oldDADPosY)
	elseif getPropertyFromClass("flixel.FlxG","keys.justPressed."..dadKeys[3]) and canMoveDadOffsets then
		setProperty("dad.y", getProperty("dad.y") -offsetAmount);
		print('DADS POS X: '..getProperty("dad.x")..', POS Y: '..getProperty("dad.y")..', ORIGIN POS X: '..oldDADPosX..', ORIGIN POS Y: '..oldDADPosY)
	elseif getPropertyFromClass("flixel.FlxG","keys.justPressed."..dadKeys[4]) and canMoveDadOffsets then
		setProperty("dad.x", getProperty("dad.x") +offsetAmount);
		print('DADS POS X: '..getProperty("dad.x")..', POS Y: '..getProperty("dad.y")..', ORIGIN POS X: '..oldDADPosX..', ORIGIN POS Y: '..oldDADPosY)
	end
end

function onEvent(name, value1, value2)
	if name == 'Change Character' then
		if value1 == 'bf' then
			oldBFPosX = getProperty("boyfriend.x");
			oldBFPosY = getProperty("boyfriend.y");
		end

		if value1 == 'dad' then
			oldDADPosX = getProperty("dad.x");
			oldDADPosY = getProperty("dad.y");
		end
	end
end