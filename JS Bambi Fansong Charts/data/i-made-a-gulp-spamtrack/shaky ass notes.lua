local anchorpos = {};
local canShake = true;

function onCreatePost()
	makeLuaSprite('shakeAmt', '', 6, 0);
	setProperty('shakeAmt.visible',false)
  	addLuaSprite('shakeAmt',false);

        for i = 0,getProperty('strumLineNotes.length')-1 do 
            xshake = getPropertyFromGroup('strumLineNotes', i, 'x')
            yshake = getPropertyFromGroup('strumLineNotes', i, 'y')
            table.insert(anchorpos, {xshake,yshake})
        end
end

shake = 0
shaking = false
function onUpdate(elapsed)
	if getProperty('shakeAmt.x') > 0 then
		shaking = true
		shake = getProperty('shakeAmt.x')
		for i = 0,getProperty('strumLineNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
			setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
		end
	elseif shaking then
		shaking = false
		for i = 0,getProperty('strumLineNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1])
			setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2])
		end
	end
end