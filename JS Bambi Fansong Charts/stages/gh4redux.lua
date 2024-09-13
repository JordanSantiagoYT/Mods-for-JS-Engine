function onCreate()
	makeLuaSprite('oppSprite', 'the man of gan', -1850, -1300);
	scaleObject('oppSprite', 1.6, 1.6);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
	setProperty('oppSprite.alpha', 0);
end

function onStepHit()
	if curStep == 4096 or curStep == 8192 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenAlpha('HESHERE', 'oppSprite', 1, 0.001, 'linear')
	end
	if curStep == 6144 or curStep == 10240 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('oppSprite.alpha', 0)
	end
end