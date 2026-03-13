function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Otherworld\n\nSong by DxrkPxwer\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaText('Misc', "Rap Battle!", 1250, 0, 320)
	setTextAlignment('Misc', 'Center')
	addLuaText('Misc')
	setProperty('Misc.alpha', 0)
	setTextSize('Misc', 60)
	setObjectCamera('Misc', 'camOther')
	setTextBorder('Misc', 3, '000000')

	setProperty('camHUD.alpha', 0.001)
	luaDebugMode = true
end

function onSongStart()
	--doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 8, 'linear')
end

healthDrain = false
function onStepHit()
	if curStep <= 16 and curStep % 2 == 0 then
		setProperty('flash.alpha', getProperty('flash.alpha') - 0.125)
		triggerEvent('Add Camera Zoom', 0.03, 0.03)
	end
	if curStep == 16 then
		doTweenAlpha('battleIn', 'Misc', 1, (60/curBpm), 'linear')
	end
	if curStep == 32 then
		doTweenAlpha('battleOut', 'Misc', 0, (240/curBpm), 'linear')
	end
	if curStep == 128 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
		setProperty('camHUD.alpha', 1)
	end
	if curStep == 160 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 640 or curStep == 2272 then
		doTweenAlpha('fade', 'flash', 0.5, (240/curBpm), 'linear')
		doTweenAlpha('byeHUD', 'camHUD', 0.001, (240/curBpm), 'linear')
	end
	if curStep == 677 or curStep == 2304 then --SIX SEVE-sorry
		setTextString('Misc', '[!]\nHealth Drain Active!')
		doTweenAlpha('UhOh', 'Misc', 1, (60/curBpm), 'linear')
		healthDrain = true
	end
	if curStep == 688 or curStep == 2320 then
		doTweenAlpha('UhOh2', 'Misc', 0, (120/curBpm), 'linear')
	end
	if curStep == 704 or curStep == 2336 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('camHUD.alpha', 1)
		setProperty('flash.alpha', 0)
	end
	if curStep == 1216 then
		cameraFlash('camOther', 'ffffff', 0.7)
		healthDrain = false
		addHealth(0.5)
		triggerEvent('Add Camera Zoom', 0.125, 0.125)
	end
	if curStep == 2864 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 1)
		healthDrain = false
	end
end

function opponentNoteHit()
	if not healthDrain then return end

       	health = getProperty('health')
       	if health > 0.1 then
		addHealth(-0.01)
	end
end