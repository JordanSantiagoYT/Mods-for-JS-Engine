local elapsedTime = 0
function onUpdate(elapsed)
    elapsedTime = elapsedTime + elapsed
    if (dadName == 'triganametriaaa') then
        setCharacterX("dad", getCharacterX("dad") + (math.sin(elapsedTime * 2) / 3))
        setCharacterY("dad", getCharacterY("dad") - (math.cos(elapsedTime * 2)))

        if (not mustHitSection) then
            cameraSetTarget("dad")
        end
    end
end