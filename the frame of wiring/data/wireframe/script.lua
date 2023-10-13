local shadname = "stridentCrisisWavy";
local objects = {'daveFuckingDies', 'redTunnel', 'dad', 'boyfriend'}
local camObjs = {'timeTxt', 'scoreTxt', 'creditsWatermark'}
local invisObjs = {'healthBar', 'healthBarBG', 'iconP2', 'iconP1'}
local colors = {'00ff00', '00FFFF', '800080', 'FFFFFF'}
local curColor = 1;
local curTxt = 0;

function onCreate()
    addCharacterToList('badai', 'dad')
    makeAnimatedLuaSprite('badaiComes', 'characters/main/wireframe/badai', 6000, -4000)
    addAnimationByPrefix('badaiComes', 'idle', 'idle', 24, true)
    objectPlayAnimation('badaiComes', 'idle', true)
    setProperty('badaiComes.antialiasing', false)
    setProperty('badaiComes.visible', false)
    setProperty('badaiComes.angle', 24)
    updateHitbox('badaiComes')
    if not lowQuality then
        addLuaSprite('badaiComes', true)
    end

    makeLuaSprite('blackBarUP', '', 0, -220)
    makeGraphic('blackBarUP', '1280', '120', '000000')
    setProperty('blackBarUP.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
    setObjectCamera('blackBarUP', 'camhud')
    addLuaSprite('blackBarUP', false)

    makeLuaSprite('blackBarDOWN', '', 0, 720)
    makeGraphic('blackBarDOWN', '1280', '120', '000000')
    setProperty('blackBarDOWN.antialiasing', getPropertyFromClass('ClientPrefs', 'globalAntialiasing'))
    setObjectCamera('blackBarDOWN', 'camhud')
    addLuaSprite('blackBarDOWN', false)
end

function onStepHit()
    if curStep == 1 then
        setProperty('defaultCamZoom', 0.95)
    end

    if curStep == 64 then
        setProperty('defaultCamZoom', 0.65)
        cameraFlash('other', 'FFFFFF', 1)
    end

    if curStep == 326 then
        setProperty('defaultCamZoom', 0.95)
        for i = 1, #camObjs do
            doTweenAlpha('invisObj2'..i, camObjs[i], 0, 1, 'sineOut')
        end
        for i = 1, #invisObjs do
            doTweenAlpha('invisObj'..i, invisObjs[i], 0, 1, 'sineOut')
        end
    end

    if curStep == 448 then
        for i = 1, #camObjs do
            doTweenAlpha('invisObj2'..i, camObjs[i], 1, 0.0001, 'sineOut')
        end
        for i = 1, #invisObjs do
            doTweenAlpha('invisObj'..i, invisObjs[i], 1, 0.0001, 'sineOut')
        end
        setProperty('defaultCamZoom', 0.65)
        cameraFlash('other', 'FFFFFF', 1)
    end

    if curStep == 568 then
        setProperty('defaultCamZoom', 0.95)
    end

    if curStep == 576 then
        for i = 1, #camObjs do
            doTweenAlpha('invisObj2'..i, camObjs[i], 0, 1, 'sineOut')
        end
        for i = 1, #invisObjs do
            doTweenAlpha('invisObj'..i, invisObjs[i], 0, 1, 'sineOut')
        end
        cameraFlash('other', 'FFFFFF', 1)
    end

    if curStep == 832 then
        for i = 1, #camObjs do
            doTweenAlpha('invisObj2'..i, camObjs[i], 1, 0.0001, 'sineOut')
        end
        for i = 1, #invisObjs do
            doTweenAlpha('invisObj'..i, invisObjs[i], 1, 0.0001, 'sineOut')
        end
        setProperty('defaultCamZoom', 0.65)
        cameraFlash('other', 'FFFFFF', 1)
    end

    if curStep == 1093 then
        for i = 1, #camObjs do
            doTweenAlpha('invisObj2'..i, camObjs[i], 0, 1, 'sineOut')
        end
        for i = 1, #invisObjs do
            doTweenAlpha('invisObj'..i, invisObjs[i], 0, 1, 'sineOut')
        end
        setProperty('defaultCamZoom', 0.95)
        cameraFlash('other', 'FFFFFF', 1)
    end

    if curStep == 1184 then
        for i = 1, #camObjs do
            doTweenAlpha('invisObj2'..i, camObjs[i], 1, 0.8, 'sineOut')
        end
        for i = 1, #invisObjs do
            doTweenAlpha('invisObj'..i, invisObjs[i], 1, 0.8, 'sineOut')
        end
        setProperty('defaultCamZoom', 0.65)
        cameraFlash('other', 'FFFFFF', 1)
    end

    if curStep == 1179 then
        doTweenAngle('badaiInFrameAngle', 'badaiComes', 0, 0.8, 'sineOut')
        doTweenX('badaiInFrameX', 'badaiComes', getProperty('dad.x') -500, 0.8, 'sineOut')
        doTweenY('badaiInFrameY', 'badaiComes', getProperty('dad.y') -200, 0.8, 'sineOut')
        setProperty('badaiComes.visible', true)
    end

    if curStep == 1600 then
        for i = 1, #camObjs do
            doTweenAlpha('invisObj2'..i, camObjs[i], 0, 1, 'sineOut')
        end
        for i = 1, #invisObjs do
            doTweenAlpha('invisObj'..i, invisObjs[i], 0, 1, 'sineOut')
        end
        setProperty('defaultCamZoom', 0.95)
    end

    if curStep == 1631 then
        for i = 1, #camObjs do
            doTweenAlpha('invisObj2'..i, camObjs[i], 1, 0.8, 'sineOut')
        end
        setProperty('defaultCamZoom', 0.65)
        cameraFlash('other', 'FFFFFF', 1)
    end

    if curStep == 2143 then
        for i = 1, #camObjs do
            doTweenAlpha('invisObj2'..i, camObjs[i], 0, 0.8, 'sineOut')
        end
        setProperty('defaultCamZoom', 0.95)
    end

    if curStep == 2153 then
        cameraFlash('other', 'FFFFFF', 1)
    end

    if curStep == 2285 then
        setProperty('defaultCamZoom', 0.65)
    end

    if curStep == 2288 then
        for i = 1, #camObjs do
            doTweenAlpha('invisObj2'..i, camObjs[i], 1, 0.8, 'sineOut')
        end
        for i = 1, #invisObjs do
            doTweenAlpha('invisObj'..i, invisObjs[i], 1, 0.8, 'sineOut')
        end
        cameraFlash('other', 'FFFFFF', 1)
    end

    if curStep == 2145 then --bandai explodes then dave comes in
        --[[doTweenAngle('dave COMIN ANG', 'daveFuckingDies', 0, 1.25, 'cubeInOut')
        doTweenX('dave COMINSCALE', 'daveFuckingDies.scale', 2, 1.25, 'cubeInOut')
        doTweenY('dave COMINSCALE A', 'daveFuckingDies.scale', 2, 1.25, 'cubeInOut')
        doTweenX('dave COMINX', 'daveFuckingDies', getProperty('dad.x') + 375 + 500, 1.25, 'cubeInOut')
        doTweenY('dave COMIN', 'daveFuckingDies', getProperty('dad.y') + 375 + 200, 1.25, 'cubeInOut')--]]
        --explosion
    end

    if curStep == 2154 then --bandai explodes then dave comes in
        setProperty('badaiComes.x', getProperty('dad.x'))
        setProperty('badaiComes.y', getProperty('dad.y'))
        setProperty('badaiComes.angle', getProperty('dad.angle'))
        doTweenAngle('badaiInFrameAngle', 'badaiComes', 24, 1, 'sineOut')
        doTweenX('badaiInFrameX2', 'badaiComes', 1000, 1, 'sineOut')
        doTweenY('badaiInFrameY2', 'badaiComes', 1000, 1, 'sineOut')
        setProperty('badaiComes.visible', true)
        cancelTween('DAVESAN')
        cancelTween('DAVESA')
        cancelTween('DAVESF')
        removeLuaSprite('daveFuckingDies', true)
        triggerEvent('Change Character', 'dad', 'tunnel-dave')
        cameraFlash('other', 'FFFFFF', 1)
    end

    if curStep == 2671 then --BF IS EXAPNOGI
        doTweenAlpha('guh', 'lightColor', 1, 13, 'cubeInOut')
        --[[[doTweenX('BG S', 'redTunnel.scale', 0.45, 12.5 * 2.5, 'cubeInOut')
        doTweenY('BG C', 'redTunnel.scale', 0.45, 12.5 * 2.5, 'cubeInOut')
        doTweenY('DAVE SX', 'dad', getProperty('dad.x') -400, 12.5, 'cubeInOut')
        doTweenY('DAVE SD', 'dad', getProperty('dad.y') -575, 12.5, 'cubeInOut')
        doTweenX('DAVE S', 'dad.scale', 0.375, 12.5, 'cubeInOut')
        doTweenY('DAVE C', 'dad.scale', 0.375, 12.5, 'cubeInOut')
        doTweenX('BF S', 'boyfriend.scale', 1.65, 12.5, 'cubeInOut')
        doTweenY('BF C', 'boyfriend.scale', 1.65, 12.5, 'cubeInOut')--]]
    end
    if curStep >= 2680 then
        triggerEvent('Screen Shake', '0.1,'..getProperty('lightColor.alpha') * 0.0085, '0.1,'..getProperty('lightColor.alpha') * 0.0085)
    end
end

function onBeatHit()
    if curStep >= 1605 and curStep <= 1630 then
        for i = 1, #invisObjs do
            doTweenAlpha('invisObj'..i, invisObjs[i], 0, 1, 'sineOut')
        end
    end
    if curStep >= 1630 and curStep <= 2143 then
        if curColor >= 5 then
            curColor = 1;
        end
        for i = 1, #objects do
            setProperty(objects[i]..'.color', getColorFromHex(colors[curColor]))
        end
        for i = 1, #camObjs do
            setProperty(camObjs[i]..'.color', getColorFromHex(colors[curColor]))
        end
        curColor = curColor +1;

        if curStep == 2143 then
            curColor = 4;
            for i = 1, #objects do
                setProperty(objects[i]..'.color', getColorFromHex(colors[curColor]))
            end
            for i = 1, #camObjs do
                setProperty(camObjs[i]..'.color', getColorFromHex(colors[curColor]))
            end
        end
    end
end

function onTweenCompleted(tag)
    if tag == 'badaiInFrameY' then
        cameraFlash('other', 'FFFFFF', 1)
        triggerEvent('Change Character', 'dad', 'badai')
        setProperty('dad.x', getProperty('badaiComes.x'))
        setProperty('dad.y', getProperty('badaiComes.y'))
        setProperty('daveFuckingDies.visible', true)
        setProperty('badaiComes.visible', false)
        --removeLuaSprite('badaiComes', true)
        cameraFlash('camother', 'FFFFFF', 1)
        doTweenY('davefuckinggoesup', 'daveFuckingDies', -125, 2.5, 'cubeInOut')
    end

    if tag == 'davefuckinggoesup' then
        doTweenAngle('DAVESAN', 'daveFuckingDies', 30, 6 * 0.85, 'sineInOut')
        doTweenX('DAVESA', 'daveFuckingDies', getProperty('redTunnel.x') + 100, 6, 'sineInOut')
        doTweenY('DAVESF', 'daveFuckingDies', getProperty('redTunnel.y') + 100, 6, 'sineInOut')
    end

    if tag == 'dave COMIN' then
        cancelTween('DAVESAN')
        cancelTween('DAVESA')
        cancelTween('DAVESF')
        removeLuaSprite('daveFuckingDies', true)
        triggerEvent('Change Character', 'dad', 'tunnel-dave')
        cameraFlash('other', 'FFFFFF', 1)
    end

    if tag == 'badaiInFrameY2' then
        removeLuaSprite('badaiComes', true)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('dad.curCharacter') == 'tunnel-dave' then
        --triggerEvent('Screen Shake', '0.1, 0.0075', '0.1, 0.0045') --old ver lmao
    end
end