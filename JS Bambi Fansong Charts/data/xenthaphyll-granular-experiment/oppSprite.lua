floatSpeed = 1
floatX = false
ogDadX = 0
opColors = {'C24B99', '00FFFF', '12FA05', 'F9393F'}
function onCreatePost()
	makeLuaSprite('oppSprite', 'simsong', 0, 300);
	scaleObject('oppSprite', 1, 1);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
end

function opponentNoteHit(i, data, type, sus)
	if not sus then
		setProperty('oppSprite.color', getColorFromHex(opColors[data+1]))
		doTweenColor('oppBack', 'oppSprite', 'ffffff', (480/curBpm))
	end
end