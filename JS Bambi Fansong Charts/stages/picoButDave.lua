local randomLol = 0
local coolThingsExists = false
local particleCount = 0
local lolBop = false
local holySHITbop = false
local cameraFreebie = false
local songPos = 0
local inTheSky = false
local endCam = false

function onCreatePost()
    --for some reason nael didnt precache the stage images, so ig im doing that
    precacheImage('predecessorBG/sky')
    precacheImage('predecessorBG/city')
    precacheImage('predecessorBG/street')
    for i=0,4,1 do
    	precacheImage('predecessorBG/win'..i)
    end
    doTweenColor("oh hi bf", "boyfriend", "000000", 0.01, "linear")
    doTweenColor("oh hi gf", "gf", "000000", 0.01, "linear")
    doTweenColor("oh hi dad", "dad", "000000", 0.01, "linear")
    setProperty("camHUD.alpha", 0)
end

function onStepHit()
    if curStep == 16 then
        makeLuaSprite('whitebg', '', 0, 0)
        setScrollFactor('whitebg', 0, 0)
        makeGraphic('whitebg', 3840, 2160, 'ffffff')
        addLuaSprite('whitebg', false)
        setProperty('whitebg.alpha', 0)
        screenCenter('whitebg', 'xy')

        doTweenAlpha("huhGone", "whitebg", 1, 240/bpm, "linear")
        doTweenAlpha("huhHi", "camHUD", 1, 240/bpm, "linear")
    end
    if curStep == 32 or curStep == 416 or curStep == 1056 then
        lolBop = true
        cameraFlash("other", "FFFFFF", 1)

        if curStep == 1056 then
            setProperty("boyfriend.scale.x", 1)
            setProperty("boyfriend.scale.y", 1)
            setProperty("dad.scale.x", 1)
            setProperty("dad.scale.y", 1)

            removeLuaSprite("sky2")

            removeParticles()

            for i=0,3,1 do
                noteTweenAlpha("bruh"..i, i, 1, 0.5, "linear")
            end
        end

        if curStep == 32 then
            doTweenColor("oh hi bf", "boyfriend", "FFFFFF", 0.01, "linear")
            doTweenColor("oh hi gf", "gf", "FFFFFF", 0.01, "linear")
            doTweenColor("oh hi dad", "dad", "FFFFFF", 0.01, "linear")
            removeLuaSprite("whitebg")
    
            makeLuaSprite("sky", "predecessorBG/sky", -150, -300)
            addLuaSprite("sky")
            setScrollFactor("sky", 0.4, 0.4)
        
            makeLuaSprite("city", "predecessorBG/city", -100, -50)
            addLuaSprite("city")
            setScrollFactor("city", 0.7, 0.7)
        
            makeLuaSprite("street", "predecessorBG/street", 0, -50)
            addLuaSprite("street")
        
            for i=0,4,1 do
                makeLuaSprite("win"..i, "predecessorBG/win"..i, -100, -50)
                addLuaSprite("win"..i)
                setScrollFactor("win"..i, 0.7, 0.7)
                setProperty("win"..i..".alpha", 0)
            end
    
            coolThingsExists = true
        end
    end
    if curStep == 160 or curStep == 544 then
        lolBop = false
        cameraFlash("other", "FFFFFF", 1)
    end
    if curStep == 288 or curStep == 672 then
        holySHITbop = true
        createParticles(250)
        setProperty('defaultCamZoom', 1.25)

        if curStep == 288 then
            cameraFlash("other", "FFFFFF", 1)
            makeLuaSprite("thing1", "", 0, -100)
            makeGraphic("thing1", 1400, 150, '000000')
            addLuaSprite("thing1")
            setObjectCamera("thing1", "hud")
            
            makeLuaSprite("thing2", "", 0, 670)
            makeGraphic("thing2", 1400, 150, '000000')
            addLuaSprite("thing2")
            setObjectCamera("thing2", "hud")

            makeLuaSprite("this thing", "predecessorBG/this thing", 0, 0)
            addLuaSprite("this thing")
            setObjectCamera("this thing", "other")
            scaleObject("this thing", 3, 3)
            screenCenter("this thing")
            setProperty("this thing.y", -1650)
            doTweenAngle("spinForever", "this thing", 1000000, 25000, "linear")

            makeLuaSprite("this thing2", "predecessorBG/this thing", 0, 0)
            addLuaSprite("this thing2")
            setObjectCamera("this thing2", "other")
            scaleObject("this thing2", 3, 3)
            screenCenter("this thing2")
            setProperty("this thing2.y", 250)
            doTweenAngle("spinForever2", "this thing2", 1000000, 25000, "linear")
        else
            doTweenAlpha("thingBack1", "this thing", 1, 0.3, "linear")
            doTweenAlpha("thingBack2", "this thing2", 1, 0.3, "linear")
        end
    end
    if curStep == 416 or curStep == 800 then
        removeParticles()
        setProperty('defaultCamZoom', 1)

        holySHITbop = false

        setProperty("thing1.y", -100)
        setProperty("thing2.y", 670)
        doTweenY("bye1", "thing1", -200, 1.5, "circIn")
        doTweenY("bye2", "thing2", 770, 1.5, "circIn")
        doTweenAlpha("thingBye1", "this thing", 0, 0.3, "linear")
        doTweenAlpha("thingBye2", "this thing2", 0, 0.3, "linear")

        if curStep == 800 then
            cameraFlash("other", "FFFFFF", 1)
            setProperty('defaultCamZoom', 0.7)
            setProperty("cameraSpeed", 100)

            makeLuaSprite("sky2", "predecessorBG/sky", -1250, -1000)
            addLuaSprite("sky2")
            setScrollFactor("sky2", 0.15, 0.15)
            addGlitchEffect("sky2", 2, 2)
            scaleObject("sky2", 2, 2)
            
            for i=4,7,1 do
                noteTweenAlpha("bruh"..i, i, 0.25, 0.5, "linear")
            end

            doTweenY("bfSky", "boyfriend", -1850, 0.5, "circOut")
            doTweenY("dadSky", "dad", -2000, 0.5, "circOut")

            setProperty("boyfriend.scale.x", 0.7)
            setProperty("boyfriend.scale.y", 0.7)
            setProperty("dad.scale.x", 0.7)
            setProperty("dad.scale.y", 0.7)
        end
    end
    if curStep == 792 then
        makeLuaSprite("camMover", "", getProperty("dad.x"), getProperty("dad.y"))
        makeGraphic("camMover", 1, 1, '000000')
        addLuaSprite("camMover")
        setProperty("camMover.alpha", 0)

        doTweenY("camGoUP", "camMover", -2000, 100/bpm, "circIn")

        cameraFreebie = true
    end
    if curStep == 808 then
        cameraFreebie = false
        setProperty("cameraSpeed", 1)
    end
    if curStep == 924 then
        for i=0,7,1 do
            if i <= 3 then
                noteTweenAlpha("bruh"..i, i, 0.25, 0.5, "linear")
            else
                noteTweenAlpha("bruh"..i, i, 1, 0.5, "linear")
            end
        end
    end
    if curStep == 1048 then
        inTheSky = false
        cameraFreebie = false
        setProperty('defaultCamZoom', 1)
        doTweenY("bfGround", "boyfriend", 300, 0.7, "circIn")
        doTweenY("dadGround", "dad", 100, 0.7, "circIn")
        setProperty("cameraSpeed", 100)
    end
    if curStep == 1060 then
        setProperty("cameraSpeed", 1)
    end
    if curStep == 1184 then
        lolBop = false

        makeLuaSprite("noyb", "", 100, 0)
        makeGraphic('noyb', 2100, 1400, '000000')
        addLuaSprite('noyb')
        setProperty("noyb.alpha", 0)

        makeLuaSprite('flash', '', 0, 0)
        makeGraphic('flash', 1280, 720, '000000')
        addLuaSprite('flash', true);
        setScrollFactor('flash', 0, 0)
        setProperty('flash.scale.x', 2)
        setProperty('flash.scale.y', 2)
        setProperty('flash.alpha', 0)
        setObjectCamera('flash', 'camOther')

        doTweenAlpha("byeBye", "flash", 1, 2.94, "linear")
        doTweenX("byeSong", "noyb", 200, 5, "linear")

        endCam = true
    end
end

function onUpdate(elapsed)
    if endCam then
        setProperty('defaultCamZoom', getProperty("noyb.x") / 100)
    end
    if cameraFreebie then
        triggerEvent("Camera Follow Pos", getProperty("camMover.x") + 600, getProperty("camMover.y") + 300)
    end
    if inTheSky then
        songPos = getSongPosition()/500
        setProperty("boyfriend.y", -1850+(math.sin(songPos)*62.5))
        setProperty("dad.y", -2000+(math.sin(songPos)*125))
    end
end

function onBeatHit()
    if lolBop then
        if (curBeat % 2 == 0) then
            setProperty("camHUD.angle", -5)
        else
            setProperty("camHUD.angle", 5)
        end
        doTweenAngle("boingy", "camHUD", 0, 60/bpm, "circOut")
    end
    if holySHITbop then
        setProperty("thing1.y", -50)
        setProperty("thing2.y", 620)
        doTweenY("yoy1", "thing1", -100, 60/bpm, "circOut")
        doTweenY("yoy2", "thing2", 670, 60/bpm, "circOut")
    end
end

function onSectionHit()
    if coolThingsExists then
        randomLol = math.random(0, 4)
        setProperty("win"..randomLol..".alpha", 1)
        doTweenAlpha("win"..randomLol, "win"..randomLol, 0.25, 240/bpm, "linear")
    end
    if mustHitSection and not cameraFreebie then
        cameraSetTarget("boyfriend")
    else
        cameraSetTarget("dad")
    end
end

function onTweenCompleted(tag)
    if luaSpriteExists(tag) then
        setProperty(tag..".alpha", 0)
    end
    if tag == 'bfSky' then
        inTheSky = true
        removeParticles()
        createParticles(500)
    end
end

function createParticles(howMany)
    for i=1,howMany,1 do
        particleCount = particleCount + 1
        makeLuaSprite("particle"..i, 'predecessorBG/blueOrb', math.random(-1500, 1500), math.random(-1500, 1500))
        addLuaSprite("particle"..i, true)
        setProperty("particle"..i..'.alpha', 0.25)
        setScrollFactor("particle"..i, math.random(-12.0, 12.0), math.random(-12.0, 12.0))
        scaleObject("particle"..i, 0.3, 0.3)
    end
end

function removeParticles()
    for i=1,particleCount,1 do
        removeLuaSprite("particle"..i)
    end
    particleCount = 0
end