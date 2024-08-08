function onCreatePost()
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
	doTweenAlpha('flTw', 'flash', 0, 28, 'linear')
end

function onStepHit()
	if curStep == 1008 or curStep == 4080 or curStep == 9200 then
		doTweenAlpha('fadeIn', 'flash', 0.9, 0.4, 'linear')
	end
	if curStep == 1024 or curStep == 4096 or curStep == 7168 or curStep == 9216 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 7136 then
		doTweenAlpha('fadeIn', 'flash', 0.9, 0.9, 'linear')
	end
	if curStep == 9792 then
		doTweenAlpha('okBye', 'flash', 1, 20, 'linear')
	end
end