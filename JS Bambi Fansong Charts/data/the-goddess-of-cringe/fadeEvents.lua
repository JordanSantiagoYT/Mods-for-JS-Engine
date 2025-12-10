function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "The Goddess of Cringe\n\nSong by Cyklus/Chulox\n\nChart by Jordan Santiago\n\nOpponent Sprites & BG by Nael2xd", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('dad.alpha', 0)
end

function onStepHit()
	if curStep == 256 then
		doTweenAlpha('fadeIn', 'flash', 0, (240/curBpm) * 16, 'linear')
		for i = 0, getProperty('opponentStrums.length')-1 do
			noteTweenAlpha('byeNote'..i, i, 0, 0.01, 'linear')
		end
	end
	if curStep == 896 then
		doTweenAlpha('dadHello', 'dad', 1, (960/curBpm) * 2, 'linear')
		noteTweenAlpha('noteIn1', 3, 0.7, (240/curBpm))
	end
	if curStep == 928 then
		noteTweenAlpha('noteIn2', 0, 0.7, (240/curBpm))
	end
	if curStep == 960 then
		doTweenAlpha('dadHello', 'dad', 1, (960/curBpm) * 2, 'linear')
		noteTweenAlpha('noteIn3', 2, 0.7, (240/curBpm))
	end
	if curStep == 992 then
		noteTweenAlpha('noteIn4', 1, 0.7, (240/curBpm))
	end
	if curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 270, (480/curBpm), 'expoOut')
		for i=0, 3 do
			noteTweenAlpha('noteFullIn'..i, i, 1, (240/curBpm))
		end
	end
	if curStep == 1152 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 2048 then
		cameraFlash('camOther', 'ffffff', 1)
	end
	if curStep == 5120 then
		cameraFlash('camOther', 'ffffff', 1)
		addBloomEffect('camHUD', 0.25)
		addBloomEffect('camGame', 0.25)
	end
	if curStep == 6144 then
		cameraFlash('camOther', 'ffffff', 1)
		clearEffects('camHUD')
		clearEffects('camGame')
		addGrayscaleEffect('camHUD')
		addGrayscaleEffect('camGame')
	end
	if curStep == 6912 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 16, 'linear')
	end
end