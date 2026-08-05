function onCreatePost()
	makeLuaSprite('bg', 'whiteout/whiteound', -1100, -700)
	setScrollFactor('bg', 0.5, 0.5)
    setProperty('bg.antialiasing',false)
	addLuaSprite('bg')
    scaleObject('bg', 1.8, 1.5)
	setSpriteShader("bg", "wavy2")
	initLuaShader("wavy2")

	makeLuaSprite('bg2', 'whiteout/whiteform', -650, -600)
	setScrollFactor('bg2', 1, 1)
    setProperty('bg2.antialiasing',false)
	addLuaSprite('bg2')
    scaleObject('bg2', 2, 2)

	makeAnimatedLuaSprite('tv-time','whiteout/tenna',550,200)
	addAnimationByPrefix('tv-time','linear','dance',30,true)
	setProperty('tv-time.antialiasing',false)
	setScrollFactor('tv-time', 1, 1)
	addLuaSprite('tv-time')
	scaleObject('tv-time', 2,2)
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/1000)
end