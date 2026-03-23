function onCreate()
	initLuaShader('BlackAndWhite');
	setSpriteShader('dad', 'BlackAndWhite');
	setShaderBool('dad', 'invert', true)
	setProperty('dad.healthColorArray', {0, 0, 0})
end
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

	makeLuaSprite('plat2', 'platform mirrored', getProperty('dadGroup.x') - 200, getProperty('dadGroup.y') + 450);
	setScrollFactor('plat2', 1, 1);
	scaleObject('plat2', 0.6, 0.6);
	addLuaSprite('plat2', false)

	setSpriteShader("bg", "glowingMarblingBlack")
	setSpriteShader('iconP2', 'BlackAndWhite');
	setShaderBool('iconP2', 'invert', true)
end
function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/1000)
end