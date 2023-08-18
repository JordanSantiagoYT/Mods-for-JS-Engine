local originalPos = 0;
local posAmount = 125;
local speedAmount = 4.5;
local tweenType = 'sineInOut';

function onCreate()
    setObjectOrder('dadGroup', 99)
    originalPos = getProperty('dad.y')
end

function onCountdownTick(tick)
    if tick == 69 then
        doTweenY('daveDown', 'dad', originalPos +posAmount, speedAmount / 2, tweenType)
    end
end

function onTweenCompleted(tag)
    if tag == 'daveDown' and getProperty('dad.curCharacter') == 'tunnel-dave' then
        doTweenY('daveUp', 'dad', originalPos -posAmount * 2.35, speedAmount * 1.125, tweenType)
    end

    if tag == 'daveUp' and getProperty('dad.curCharacter') == 'tunnel-dave' then
        doTweenY('daveDown', 'dad', originalPos +posAmount, speedAmount, tweenType)
    end
end

function onEvent(tag, val1, val2)
    if tag == 'Change Character' and val2 == 'tunnel-dave' then
        doTweenY('daveDown', 'dad', originalPos +posAmount, speedAmount / 2, tweenType)
    end
end