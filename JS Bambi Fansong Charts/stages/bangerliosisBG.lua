function onCreate()
	makeLuaSprite('bgNormal','bangerliosis/bg normal',-1280,-950)
	setLuaSpriteScrollFactor('bgNormal', 0, 0)
	scaleObject('bgNormal', 2.5, 2.5)
	addGlitchEffect('bgNormal', 3,10,0.25);
   	addLuaSprite('bgNormal',false)

	makeLuaSprite('bgAlt','bangerliosis/bg evil',-1280,-950)
	setLuaSpriteScrollFactor('bgAlt', 0, 0)
	scaleObject('bgAlt', 2.5, 2.5)
	addGlitchEffect('bgAlt', 3,10,0.25);
   	addLuaSprite('bgAlt',false)
	setProperty('bgAlt.visible', false)
end