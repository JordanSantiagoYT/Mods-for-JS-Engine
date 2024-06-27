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
	doTweenAlpha('flTw', 'flash', 0, 13, 'linear')
end

function onStepHit()
	if curStep == 248 or curStep == 1272 then
		doTweenAlpha('shortFade', 'flash', 0.9, 0.48, 'linear')
	end
	if curStep == 256 or curStep == 768 or curStep == 1280 or curStep == 1792 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 752 or curStep == 1776 then
		doTweenAlpha('coolFadeIn', 'flash', 0.8, 1, 'linear')
	end
	if curStep == 1936 then
		doTweenAlpha('okBye', 'flash', 1, 8, 'linear')
	end
end