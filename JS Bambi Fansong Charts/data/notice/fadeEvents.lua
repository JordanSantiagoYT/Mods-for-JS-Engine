function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Notice\n\nSong by DaniilPoyasov\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('defaultCamZoom', 0.2)
	setProperty('FlxG.camera.zoom', 0.2)
	setProperty('boyfriend.singDuration', 16)
	setProperty('dad.singDuration', 16)

	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0.5, (240/curBpm) * 15.9, 'expoIn')
end
function onStepHit()
	if curStep == 256 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep >= 736 and curStep < 752 then
		if curStep % 4 == 0 then
			for i = 0, 7 do
				noteTweenAlpha('alphaOn'..i..'X', i, 0.7, 0.01, 'expoOut')
				noteTweenAlpha('alphaOn'..i..'Y', i, 0.7, 0.01, 'expoOut')
				noteTweenAlpha('alphaOff'..i..'X', i, 0, (50/curBpm), 'linear')
				noteTweenAlpha('alphaOff'..i..'Y', i, 0, (50/curBpm), 'linear')
			end
		end
	end
	if curStep >= 752 and curStep < 760 then
		if curStep % 2 == 0 then
			for i = 0, 7 do
				noteTweenAlpha('alphaOn'..i..'X', i, 0.7, 0.01, 'expoOut')
				noteTweenAlpha('alphaOn'..i..'Y', i, 0.7, 0.01, 'expoOut')
				noteTweenAlpha('alphaOff'..i..'X', i, 0, (25/curBpm), 'linear')
				noteTweenAlpha('alphaOff'..i..'Y', i, 0, (25/curBpm), 'linear')
			end
		end
	end
	if curStep == 760 then
		for i = 0, 7 do
			noteTweenAlpha('alphaOn'..i..'X', i, 1, 0.01, 'expoOut')
			noteTweenAlpha('alphaOn'..i..'Y', i, 1, 0.01, 'expoOut')
		end
	end
	if curStep == 768 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, (960/curBpm), 'expoOut')
	end
	if curStep == 896 then
		doTweenY('creditTween', 'Credits', -420, (960/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (960/curBpm), 'linear')
	end
	if curStep == 4096 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
	end
end

function onEvent(n,v1,v2)
	if n == 'Change Character' then
		setProperty('dad.singDuration', 16)
		setProperty('boyfriend.singDuration', 16)
	end
end