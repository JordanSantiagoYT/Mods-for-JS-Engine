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
	doTweenAlpha('flTw', 'flash', 0, 8, 'linear')
end

function onStepHit()
	if curStep == 3840 then
		doTweenAlpha('fadeDrug1', 'flash', 0.9, 1.84, 'linear')
	end
	if curStep == 3968 then
		doTweenAlpha('fadeDrug2', 'flash', 0, 1.38, 'linear')
	end
	if curStep == 4064 then
		doTweenAlpha('fadeDrug3', 'flash', 0.9, 0.23, 'linear')
	end
	if curStep == 4080 then
		doTweenAlpha('fadeDrug4', 'flash', 0, 0.16, 'linear')
	end
	if curStep == 4092 or curStep == 9212 then
		doTweenAlpha('fadeDrug5', 'flash', 0.9, 0.06, 'linear')
	end
	if curStep == 4096 or curStep == 9216 or curStep == 9217 then
		doTweenAlpha('fadeDrug6', 'flash', 0, 14.25, 'linear')
	end
	if curStep == 5104 or curStep == 10224 then
		doTweenAlpha('fadeDrug7', 'flash', 0.9, 0.125, 'linear')
	end
	if curStep == 5116 or curStep == 10236 then
		doTweenAlpha('fadeDrug8', 'flash', 0, 0.06, 'linear')
	end
	if curStep == 7040 or curStep == 12160 then
		doTweenAlpha('fadeDrug9', 'flash', 0.9, 0.92, 'linear')
	end
	if curStep == 7104 or curStep == 12224 then
		doTweenAlpha('fadeDrug10', 'flash', 0, 0.92, 'linear')
	end
	if curStep == 8960 then
		doTweenAlpha('fadeDrug11', 'flash', 1, 1.84, 'linear')
	end
	if curStep == 9088 then
		doTweenAlpha('fadeDrug12', 'flash', 0, 1.15, 'linear')
	end
	if curStep == 9168 then
		doTweenAlpha('fadeDrug13', 'flash', 1, 0.34, 'linear')
	end
	if curStep == 9192 then
		doTweenAlpha('fadeDrug14', 'flash', 0, 0.2, 'linear')
	end
	if curStep == 15872 or curStep == 15873 then
		doTweenAlpha('byebyE!', 'flash', 1, 6.7, 'linear')
	end
end