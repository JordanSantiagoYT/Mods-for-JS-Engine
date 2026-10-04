function onCreatePost()
	makeLuaSprite('bg', 'spam/spamground', -1600, -900)
	setScrollFactor('bg', 0, 0)
	addLuaSprite('bg')
    scaleObject('bg', 3.7, 3.9)

	makeLuaSprite('eff', 'spam/spamground', -1700, -900)
	setScrollFactor('eff', 0.5, 0.5)
	addLuaSprite('eff')
    scaleObject('eff', 3.9, 3.9)
	setBlendMode('eff', 'subtract')
	setSpriteShader("eff", "wavy2")
	initLuaShader("wavy2")

	makeLuaSprite('spikes', 'spam/spamkes', -2000, -200)
	setScrollFactor('spikes', 0.5, 0.5)
	addLuaSprite('spikes')
    scaleObject('spikes', 2.8, 2.8)
	setSpriteShader("spikes", "scroll")
	initLuaShader("scroll")

	makeLuaSprite('spikes2', 'spam/spamkes', -2000, -0)
	setScrollFactor('spikes2', 0.5, 0.5)
	addLuaSprite('spikes2')
    scaleObject('spikes2', 2.8, 2.8)
	setSpriteShader("spikes2", "scroll")
	initLuaShader("scroll2")

	makeLuaSprite('spikes3', 'spam/spamkes', -2000, 400)
	setScrollFactor('spikes3', 0.5, 0.5)
	addLuaSprite('spikes3')
    scaleObject('spikes3', 2.8, 2.8)
	setSpriteShader("spikes3", "scroll")
	initLuaShader("scroll3")

	makeLuaSprite('pt', 'spam/spamform', -160, 150)
	setScrollFactor('pt', 1, 1)
	addLuaSprite('pt')
    scaleObject('pt', 1.5, 1.5)

	doTweenColor('color', 'boyfriend', 'ff8f8f', 0.01, 'sineOut')
end
function onUpdate(elapsed)
--don't use os.clock(). it relies on system time so if the song is rendered then there will be noticeable cuts. use getSongPosition() instead

pos = getSongPosition() / 1000
setShaderFloat('eff', 'iTime', pos)
setShaderFloat('spikes','iTime', pos * 2)
setShaderFloat('spikes2','iTime', pos * 4)
setShaderFloat('spikes3','iTime', pos * 6)
end