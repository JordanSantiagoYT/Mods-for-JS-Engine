local tweenedHud = {
    'timeBar',
    'timeBarBG',
    'healthBar',
    'healthBarBG',
    'iconP1',
    'iconP2',
    'timeTxt',
    'scoreTxt',
    'camHUD'
}

function onEvent(name, value1, value2)
    if name == 'Hud Fade' then
        for i, specHud in pairs(tweenedHud) do
            doTweenAlpha('tween'..i, specHud, value2, value1, elasticInOut)
        end
    end
end