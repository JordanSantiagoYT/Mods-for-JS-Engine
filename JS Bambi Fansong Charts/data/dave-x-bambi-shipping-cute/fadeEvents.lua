function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camGame')
	setProperty('camHUD.alpha', 0.0001)
	makeLuaText('funnyWatermark', 'Made by Jordan Santiago', 1250, 0, 720)
	setTextAlignment('funnyWatermark', 'Center')
	addLuaText('funnyWatermark')
	setTextSize('funnyWatermark', 40)
	setObjectCamera('funnyWatermark', 'camOther')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenY('watermarkTween', 'funnyWatermark', 360, 1.3, 'expoOut')
end

function onStepHit()
	if curStep == 8 then
		doTweenAlpha('hudFadeIn', 'camHUD', 1, 0.4, 'linear')
	end
	if curStep == 16 then
		removeLuaText('funnyWatermark');
		cameraFlash('camOther', 'ffffff', 1)
		setProperty('flash.alpha', 0)
		setObjectCamera('flash', 'camOther')
		setProperty('ytWatermark.alpha', 0.5)
	end
	if curStep == 400 then
		for i = 0, 7 do
            noteTweenAlpha('noteBye'..i, i, 0, 1, 'linear');
		end
	end
	if curStep == 512 then
		for i = 0, 7 do
            noteTweenAlpha('noteBack'..i, i, 1, 1, 'linear');
		end
	end
	if curStep == 912 then
		doTweenAlpha('ending', 'flash', 1, 1.4, 'linear')
	end
end