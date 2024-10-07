function onCreate()
	makeLuaSprite('redBG', 'redGalaxy', -1050, -630);
	scaleObject('redBG', 3.5, 3.5);
    setScrollFactor('redBG', 0, 0);
	addLuaSprite('redBG', false);
	addGlitchEffect('redBG', 2,10,0.1);
	makeLuaSprite('oppSprite', 'transfinite2Guy', -1250, -830);
	scaleObject('oppSprite', 1.6, 1.6);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
	setProperty('oppSprite.alpha', 0);
end

-- step events (used for transfinite 2), if you dont want them then remove this part
function onStepHit()
	if curStep == 1536 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenAlpha('HESHERE', 'oppSprite', 1, 0.001, 'linear')
	end
end