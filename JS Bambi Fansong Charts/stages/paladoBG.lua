function onCreatePost()
	makeLuaSprite('bg','soRed',-680,-350)
	setLuaSpriteScrollFactor('bg', 0, 0)
	scaleObject('bg', 2.5, 2.5)
	addGlitchEffect('bg', 2,5,0.2);
   	addLuaSprite('bg',false)
	setSpriteShader("bg", "GraySmokeTwo")

	makeLuaSprite('plat', 'platform mirrored', getProperty('boyfriendGroup.x') - 200, getProperty('boyfriendGroup.y') + 540);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.6, 0.6);
	--setProperty('plat.color', getColorFromHex('7D0000'))
	addLuaSprite('plat', false)
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/300)
end