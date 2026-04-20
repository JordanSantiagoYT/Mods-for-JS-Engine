ogDadY = 0
function onCreatePost()
	-- shaders!!
	initLuaShader("glowingMarblingBlack")

	makeLuaSprite('bg', 'black', -1600, -900);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 3.5, 3.5);
	setProperty('bg.alpha', 1)
	addLuaSprite('bg', false)

	makeLuaSprite('plat', 'platform mirrored', getProperty('boyfriendGroup.x') - 240, getProperty('boyfriendGroup.y') + 500);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.7, 0.7);
	addLuaSprite('plat', false)

	ogDadY = getProperty('dad.y')

	setSpriteShader("bg", "glowingMarblingBlack")
end

function onUpdate(elapsed)
	songPos = getSongPosition()
	setShaderFloat('bg', 'iTime', songPos/1000)
	local currentBeat = (songPos/4000)*(curBpm/120)
	doTweenY('opponentmove', 'dad', ogDadY - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
	if not mustHitSection then
		cameraSetTarget('dad')
	end
end