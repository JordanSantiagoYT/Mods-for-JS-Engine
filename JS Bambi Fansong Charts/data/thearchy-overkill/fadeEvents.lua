local anchorpos = {};
local dadPos = {};

function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaSprite('shakeAmt', '', 6, 0);
	setProperty('shakeAmt.visible',false)
  	addLuaSprite('shakeAmt',false);

        for i = 0,getProperty('strumLineNotes.length')-1 do 
            xshake = getPropertyFromGroup('strumLineNotes', i, 'x')
            yshake = getPropertyFromGroup('strumLineNotes', i, 'y')
            table.insert(anchorpos, {xshake,yshake})
        end
	table.insert(dadPos, {getProperty('dad.x'), getProperty('dad.y')})
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 17, 'linear')
end

function onSectionHit()
	if curSection >= 384 and curSection <= 640 and curSection % 64 == 0 then
		setProperty('shakeAmt.x', 6)
		if curSection ~= 640 then doTweenX('shakeIntensifies', 'shakeAmt', 20, (240/curBpm) * 64) end
	end
	if curSection == 768 then
		doTweenX('shakeAway', 'shakeAmt', 0, (240/curBpm) * 64)
	end
	if curSection == 832 then
		doTweenAlpha('okBye', 'flash', 1, 9, 'linear')
	end
end

shake = 0
function onUpdate(elapsed)
	if getProperty('shakeAmt.x') > 0 then
		shake = getProperty('shakeAmt.x')
		for i = 0,getProperty('strumLineNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
			setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
		end
		setProperty('dad.x', dadPos[1][1] + math.random(-shake * 4,shake * 4))
		setProperty('dad.y', dadPos[1][2] + math.random(-shake * 4,shake * 4))
	end
end