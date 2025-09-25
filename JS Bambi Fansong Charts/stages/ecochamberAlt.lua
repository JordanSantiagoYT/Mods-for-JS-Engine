function onCreate()
	makeLuaSprite('bg', 'nothing', -1200, -600);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 3, 3);
	addLuaSprite('bg', false)
	setProperty('bg.alpha', 1)

	makeLuaSprite('bg2', 'nothing', -1200, -600);
	setLuaSpriteScrollFactor('bg2', 0.5, 0.5);
	scaleObject('bg2', 3, 3);
	addLuaSprite('bg2', false)

	makeLuaSprite('bg3', 'v', -1000, -600);
	setLuaSpriteScrollFactor('bg3', 0, 0);
	scaleObject('bg3', 2.6, 2.6);
	addLuaSprite('bg3', false)
	setProperty('bg3.alpha', 0.6)

	--this isn't actually used until a later part, i'm just doing it to save the trouble of having to use 2 different files
	initLuaShader("ecochamber3")
	setSpriteShader("bg", "ecochamber3")

	initLuaShader("ecochamber2")
	setSpriteShader("bg2", "ecochamber2")

	setObjectOrder("bg3", getObjectOrder("boyfriendGroup")+1)
	setObjectOrder('gfGroup', getObjectOrder('bg3'))
	setObjectOrder('dadGroup', getObjectOrder('bg3'))

end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/800)
	setShaderFloat('bg2', 'iTime', getSongPosition()/800)
end