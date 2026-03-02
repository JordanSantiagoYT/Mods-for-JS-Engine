function onCreate()
	makeLuaSprite('whitebg', '', 0, 0)
	setScrollFactor('whitebg', 0, 0)
	makeGraphic('whitebg', 3840, 2160, 'ffffff')
	addLuaSprite('whitebg', false)
	screenCenter('whitebg', 'xy')
	makeLuaSprite('1', 'emberglow', -800, -200);
    setProperty('1.antialiasing', false)
	setObjectOrder('1', 3, false);
	
        scaleObject('1', 6, 6);

		setLuaSpriteScrollFactor('1', 0.75, 0.75);

	addLuaSprite('1', false);
    setBlendMode('1', 'add')
	initLuaShader("adjustColor")
	setSpriteShader("1", "adjustColor")
end

function onUpdate(elapsed)
    if curStep == 0 then
    started = true
    end
    songPos = getSongPosition()
    local currentBeat = (songPos/10000)*(curBpm/65)
    if curStep <= 4350 then
        doTweenX('embermove', '1', -320 - -340*math.sin((currentBeat+5*10)*math.pi), 1)
    end
end