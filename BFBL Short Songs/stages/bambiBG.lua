function onCreate()

	makeLuaSprite('theBg','bambiBG/sky',-680,-130)
	addLuaSprite('theBg',false)
	setLuaSpriteScrollFactor('theBg', 0.1, 0.1)

	makeLuaSprite('grasshill','bambiBG/gm_flatgrass', 450, 95)
	scaleObject('grasshill', 0.3, 0.3);
	addLuaSprite('grasshill',false)
	setLuaSpriteScrollFactor('grasshill', 0.3, 0.3)

	makeLuaSprite('hills','bambiBG/orangey hills', -380, 120)
	addLuaSprite('hills',false)
	setLuaSpriteScrollFactor('hills', 0.3, 0.3)

	makeLuaSprite('farm','bambiBG/funfarmhouse', -20, 160)
	addLuaSprite('farm',false)
	setLuaSpriteScrollFactor('farm', 0.6, 0.6)

	makeLuaSprite('ground','bambiBG/grass lands', -680, 550)
	addLuaSprite('ground',false)
	setLuaSpriteScrollFactor('ground', 1, 1)

	makeLuaSprite('corn1','bambiBG/CornFence', -440, 275)
	addLuaSprite('corn1',false)
	setLuaSpriteScrollFactor('corn1', 1, 1)

	makeLuaSprite('corn2','bambiBG/CornFence2', 1080, 275)
	addLuaSprite('corn2',false)
	setLuaSpriteScrollFactor('corn2', 1, 1)

	makeLuaSprite('thecornbag','bambiBG/cornbag', 1180, 605)
	addLuaSprite('thecornbag',false)
	setLuaSpriteScrollFactor('thecornbag', 1, 1)

	makeLuaSprite('sign','bambiBG/Sign', -40, 415)
	addLuaSprite('sign',false)		
	setLuaSpriteScrollFactor('sign', 1, 1)
end
