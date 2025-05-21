local tweenedHud = {
    'timeBar',
    'timeBarBG',
    'healthBar',
    'healthBarBG',
    'iconP1',
    'iconP2',
    'timeTxt',
    'scoreTxt',
}

function onEvent(name, value1, value2)
    if name == 'Hud Fade' then
        for i, specHud in pairs(tweenedHud) do
            doTweenAlpha('tween'..i, specHud, value2, value1, elasticInOut)
        end
	for i = 0, getProperty('strumLineNotes.length')-1 do
	    noteTweenAlpha('alphaDo'..i, i, value2, value1, elasticInOut)
	end
    end
end