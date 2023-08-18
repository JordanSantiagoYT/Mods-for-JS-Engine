local regAnims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'};
local altAnims = {'singLEFT-alt', 'singDOWN-alt', 'singUP-alt', 'singRIGHT-alt'};
local bfCamIdle = {};
local dadCamIdle = {};

local offsets = 30;
local posBFX = {}
local posBFY = {}

function onUpdate() --camera now follows characters!!!!
	bfCamIdle[0] = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') - getProperty('boyfriendCameraOffset[0]');
	bfCamIdle[1] = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]');
	dadCamIdle[0] = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]');
	dadCamIdle[1] = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]');
	if mustHitSection == true then
		if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			moveCam(bfCamIdle[0], bfCamIdle[1]);
		end
	end
	if mustHitSection == false then
		if getProperty('dad.animation.curAnim.name') == 'idle' then
			moveCam(dadCamIdle[0], dadCamIdle[1]);
		end
		if getProperty('dad.curCharacter') == 'bandu' then
			moveCam(bfCamIdle[0], bfCamIdle[1]);
		end
		if getProperty('dad.curCharacter') == 'bandu-sad' then
			moveCam(625, dadCamIdle[1]);
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if mustHitSection == true then
		if direction == 0 then
			moveCam(bfCamIdle[0] -offsets, bfCamIdle[1]);
		end
		if direction == 1 then
			moveCam(bfCamIdle[0], bfCamIdle[1] +offsets);
		end
		if direction == 2 then
			moveCam(bfCamIdle[0], bfCamIdle[1] -offsets);
		end
		if direction == 3 then
			moveCam(bfCamIdle[0] +offsets, bfCamIdle[1]);
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('dad.curCharacter') == 'bandu-sad' then
		return;
	end
	if mustHitSection == false then
		if direction == 0 then
			moveCam(dadCamIdle[0] -offsets, dadCamIdle[1]);
		end
		if direction == 1 then
			moveCam(dadCamIdle[0], dadCamIdle[1] +offsets);
		end
		if direction == 2 then
			moveCam(dadCamIdle[0], dadCamIdle[1] -offsets);
		end
		if direction == 3 then
			moveCam(dadCamIdle[0] +offsets, dadCamIdle[1]);
		end
	end
end

function moveCam(x, y)
	triggerEvent('Camera Follow Pos', ''..x, ''..y) --didn't want to see this stupid shit everywhere
end