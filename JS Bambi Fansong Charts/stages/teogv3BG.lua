function onCreate()

	-- shaders!!
	initLuaShader("teogBG1")
	initLuaShader("teogBG2")
	initLuaShader("teogBG3")
	initLuaShader("teogBGFinal", 140) --version 140 because otherwise it'll crash lol

	--graphics for shaders

	makeLuaSprite('bg1', 'black', -1600, -900);
	setLuaSpriteScrollFactor('bg1', 0, 0);
	scaleObject('bg1', 3.5, 3.5);
	setProperty('bg1.alpha', 1)
	addLuaSprite('bg1', false)

	setSpriteShader("bg1", "teogBG1")

	makeLuaSprite('bg2', 'teogBG/Lichen', -1600, -900);
	setLuaSpriteScrollFactor('bg2', 0, 0);
	scaleObject('bg2', 3, 3)
	setProperty('bg2.alpha', 0)
	addLuaSprite('bg2', false);

	setSpriteShader("bg2", "teogBG3")

	makeLuaSprite('bg3', 'teogBG/SmallNoise', -1600, -900);
	setLuaSpriteScrollFactor('bg3', 0, 0);
	scaleObject('bg3', 75, 42.3)
	setProperty('bg3.alpha', 0)
	addLuaSprite('bg3', false);

	setSpriteShader("bg3", "teogBG3")

	makeLuaSprite('bg4', 'black', -1600, -900);
	setLuaSpriteScrollFactor('bg4', 0, 0);
	scaleObject('bg4', 3.5, 3.5);
	setProperty('bg4.alpha', 0)
	addLuaSprite('bg4', false)

	setSpriteShader("bg4", "teogBGFinal")
end

function onStepHit()
	if curStep == 0 then setProperty('bg1.alpha', 1) end
	if curStep == 2048 then setSpriteShader('bg1', 'teogBG2') end
	if curStep == 3904 then
		setProperty('bg1.alpha', 0)
		setProperty('bg2.alpha', 1)
	end
	if curStep == 5568 then
		setProperty('bg2.alpha', 0)
		setProperty('bg3.alpha', 1)
	end
	if curStep == 6720 then
		setProperty('bg3.alpha', 0)
		setProperty('bg4.alpha', 1)
	end
end

function onUpdate(elapsed)
	setShaderFloat('bg1', 'iTime', getSongPosition()/500)
	setShaderFloat('bg2', 'iTime', getSongPosition()/500)
	setShaderFloat('bg3', 'iTime', getSongPosition()/300)
	setShaderFloat('bg4', 'iTime', getSongPosition()/500)
end