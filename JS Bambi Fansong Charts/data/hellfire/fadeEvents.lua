function onCreate()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
end

function onSongStart()
	doTweenAlpha('flashOut', 'flash', 0, 20, 'linear')
end
function onStepHit()
	if curStep == 512 then
   	    setProperty('flash.alpha', 1)
	end
	if curStep == 544 or curStep == 1056 then
   	    cameraFlash('camOther', 'ffffff', 1)
	    setProperty('flash.alpha', 0)
	end
	if curStep == 1024 then
   	    doTweenAlpha('flashInOut1', 'flash', 0.6, 1.3, 'linear')
	end
	if curStep == 1040 then
   	    doTweenAlpha('flashInOut2', 'flash', 0, 1.3, 'linear')
	end
	if curStep == 2560 then
   	    doTweenAlpha('flashInOut1', 'flash', 1, 2.6, 'linear')
	end
	if curStep == 2592 then
   	    cameraFlash('camOther', 'ffffff', 1)
	end
end