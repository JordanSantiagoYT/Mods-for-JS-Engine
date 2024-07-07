function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')
	setProperty('dad.alpha', 0)
	setProperty('iconP2.alpha', 0)
	makeLuaText('GiantFuckingAlert', '!', 1280, 0, 240)
	setTextAlignment('GiantFuckingAlert', 'Center')
	setObjectCamera('GiantFuckingAlert', 'camOther')
	addLuaText('GiantFuckingAlert')
	setTextSize('GiantFuckingAlert', 200)
	setTextColor('GiantFuckingAlert', 'FF0000')
	setProperty('GiantFuckingAlert.alpha', 0)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0.5, 4, 'linear')
end

function onStepHit()
	if curStep == 124 then
		doTweenAlpha('shortFade', 'flash', 1, 0.2, 'linear')
	end
	if curStep == 128 or curStep == 768 or curStep == 1088 or curStep == 1536 or curStep == 2048 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setProperty('dad.alpha', 1)
		setProperty('iconP2.alpha', 1)
	end
	if curStep == 752 then
		doTweenAlpha('fadeIn', 'flash', 0.9, 0.9, 'linear')
	end
	if curStep == 1024 or curStep == 1032 or curStep == 1040 or curStep == 1048 or curStep == 1056 or curStep == 1064 or curStep == 1072 then
		setProperty('flash.alpha', 0)
		doTweenAlpha('coolFlashEffect', 'flash', 0.9, 0.2, 'linear')
	end
	if curStep == 1080 then
		doTweenAlpha('coolFlashEffect2', 'flash', 0.4, 0.4, 'linear')
	end
	if curStep == 1276 then
		doTweenAlpha('blackOut', 'flash', 0.6, 0.2, 'linear')
	end
	if curStep == 2044 or curStep == 2046 then
		setProperty('flash.alpha', 0.6)
		setProperty('GiantFuckingAlert.alpha', 1)
	end
	if curStep == 2045 or curStep == 2047 then
		setProperty('GiantFuckingAlert.alpha', 0)
	end
	if curStep == 2688 then
		doTweenAlpha('okBye', 'flash', 1, 7.5, 'linear')
	end
end