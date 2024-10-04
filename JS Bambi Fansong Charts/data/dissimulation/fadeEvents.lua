function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 0)
	setObjectCamera('flash', 'camOther')
end

function onStepHit()
	if curStep == 8192 then
		doTweenAlpha('okBye', 'flash', 1, 2, 'linear')
	end
end

glitchAmount = 1;

function onBeatHit()
	if curBeat >= 256 and curBeat < 512 and curBeat % 4 == 0 then
		glitchAmount = 0.0125;
	end
	if curBeat == 512 or curBeat == 1536 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('theBg.alpha', 0)
	end
	if curBeat == 1024 or curBeat == 1792 then
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('theBg.alpha', 1)
	end
	if curBeat >= 1024 and curBeat < 1536 and curBeat % 16 == 0 or curBeat >= 1792 and curBeat <= 2048 and curBeat % 4 == 0 then
		glitchAmount = 0.025;
	end
end

function onUpdate(elapsed)
	if curBeat >= 256 and curBeat < 513 or curBeat >= 1024 and curBeat <= 1537 or curBeat >= 1792 and curBeat <= 2049 then
    		clearEffects('camHUD')
    		clearEffects('camGame')
		if curBeat >= 1792 and curBeat <= 2048 then
			addBloomEffect('camhud', 0.3)
        		addBloomEffect('camgame', 0.3)
		end
	end
end
function onUpdatePost(elapsed)
	if curBeat >= 256 and curBeat < 512 or curBeat >= 1792 and curBeat <= 2048 then
    		glitchAmount = glitchAmount * 0.9
   		addChromaticAbberationEffect('camGame', glitchAmount)
    		addChromaticAbberationEffect('camHUD', glitchAmount)
	end
	if curBeat >= 1024 and curBeat < 1536 then
    		glitchAmount = glitchAmount * 0.975
   		addChromaticAbberationEffect('camGame', glitchAmount)
    		addChromaticAbberationEffect('camHUD', glitchAmount)
	end
end