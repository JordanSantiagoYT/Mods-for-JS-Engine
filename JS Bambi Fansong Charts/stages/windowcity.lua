function onCreate()

	makeLuaSprite('bg','metropBG/bg',-1400,-900)
	addLuaSprite('bg',false)
 	scaleObject('bg', 4, 4)
    	addGlitchEffect('bg', 2, 6);
	setLuaSpriteScrollFactor('bg', 0.25, 0.25)

	-- CPU Fryer Bandu
	makeLuaSprite('opp1', 'metropBG/paincorn', -2320, -960);
	scaleObject('opp1', 1.8, 1.8);
    	setScrollFactor('opp1', 1, 1);
	addLuaSprite('opp1', false);
	setProperty('opp1.alpha', 1)

	-- CPU Fryer Bandu
	makeLuaSprite('opp2', 'metropBG/cpuFryerBandu', 20, 160);
	scaleObject('opp2', 1.8, 1.8);
    	setScrollFactor('opp2', 1, 1);
	addLuaSprite('opp2', false);
	setProperty('opp2.alpha', 0)

	--Imagine if ninja got a LOW TAPER FADE!
	makeLuaSprite('opp3', 'metropBG/ninja', -120, 360);
	scaleObject('opp3', 0.6, 0.6);
    	setScrollFactor('opp3', 1, 1);
	addLuaSprite('opp3', false);
	setProperty('opp3.alpha', 0)

	--morpheus ninja!
	makeLuaSprite('opp4', 'metropBG/morpheusfade', -120, 360);
	scaleObject('opp4', 0.6, 0.6);
    	setScrollFactor('opp4', 1, 1);
	addLuaSprite('opp4', false);
	setProperty('opp4.alpha', 0)

	--average new r oc
	makeLuaSprite('opp5', 'metropBG/metalMulti', -420, 60);
	scaleObject('opp5', 2, 2);
    	setScrollFactor('opp5', 1, 1);
	addLuaSprite('opp5', false);
	setProperty('opp5.alpha', 0)

	--flatfuck dinglecousin
	makeLuaSprite('opp6', 'metropBG/flatfuck', -2320, -960);
	scaleObject('opp6', 5, 5);
    	setScrollFactor('opp6', 1, 1);
	addLuaSprite('opp6', false);
	setProperty('opp6.alpha', 0)
end

function onStepHit()
	if curStep == 4608 then
		setProperty('opp1.alpha', 0)
		setProperty('opp2.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 9216 then
		setProperty('opp2.alpha', 0)
		setProperty('opp3.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 9984 then
		setProperty('opp3.alpha', 0)
		setProperty('opp4.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.5)
	end
	if curStep == 10368 then
		setProperty('opp4.alpha', 0)
		setProperty('opp3.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 11648 then
		setProperty('opp3.alpha', 0)
		setProperty('opp5.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 14976 then
		setProperty('opp5.alpha', 0)
		setProperty('opp6.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 17664 then
		doTweenAlpha('byeFlatfuck', 'opp5', 0, 3.65, 'linear')
	end
end