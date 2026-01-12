ogDadY = 0

function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Taimuresu\n\nSong by Maevings\n\nChart by Jordan Santiago\n\nAll Sprites from Strident Crisis: Rebooted", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('camHUD.alpha', 0.001)

	makeLuaSprite('backOld', 'oppoOld/OppositonLol', -1700, -1000);
	setScrollFactor('backOld', 0.5, 0.5);
	scaleObject('backOld', 2.5, 2.5)
	addGlitchEffect('backOld', 2,5,0.1)
	setProperty('backOld.alpha', 0)
	
	makeLuaSprite('frontOld', 'oppoOld/ThanosGround', 650, 600);
	setScrollFactor('frontOld', 0.9, 0.9);
	scaleObject('frontOld', 0.9, 0.9);
	setProperty('frontOld.alpha', 0.001)

	addLuaSprite('backOld', false)
	addLuaSprite('frontOld', false)

	ogDadY = getProperty('dad.y')
	setProperty('dad.y', -1600)
end

function onSongStart()
	doTweenAlpha('fadeIn', 'flash', 0, (240/curBpm) * 16, 'linear')
end

function onStepHit()
	if curStep == 224 then
		doTweenY('opponentComes', 'dad', dadPositionY, (240/curBpm) * 1.6, 'expoOut')
	end
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setProperty('dad.alpha', 1)
		setProperty('camHUD.alpha', 1)
		doTweenY('creditTween', 'Credits', 280, (240/curBpm), 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 2048 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('back.alpha', 0.001)
		setProperty('front.alpha', 0.001)
		setProperty('backOld.alpha', 1)
		setProperty('frontOld.alpha', 1)
	end
	if curStep == 2560 or curStep == 6784 then
		doTweenAlpha('hudBye', 'camHUD', 0.001, (960/curBpm), 'linear')
	end
	if curStep == 2656 or curStep == 4192 or curStep == 6880 then
		cameraFade('camOther', 'ffffff', (440/curBpm))
	end
	if curStep == 2688 or curStep == 4224 or curStep == 6912 then
		cameraFade('camOther', 'ffffff', (720/curBpm), true, true)
		setProperty('back.alpha', 1)
		setProperty('front.alpha', 1)
		setProperty('backOld.alpha', 0)
		setProperty('frontOld.alpha', 0.001)
	end
	if curStep == 2944 or curStep == 4736 or curStep == 7168 then
		cameraFlash('camOther', 'ffffff', 1.4)
		setProperty('camHUD.alpha', 1)
	end
	if curStep == 3968 or curStep == 8704 then
		doTweenAlpha('hudBye', 'camHUD', 0.001, (1920/curBpm), 'linear')
	end
	if curStep == 8832 then
		doTweenAlpha('fadeIn', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
end

--credits to BFDI 26 for this code
function onUpdatePost(elapsed)
	if curStep > 256 then
		setProperty('dadGroup.x', getProperty('dadGroup.x') + 2 * math.cos(curDecBeat / 8 * math.pi) * elapsed * 60)
		setProperty('dadGroup.y', getProperty('dadGroup.y') + 2 * math.sin(curDecBeat / 8 * math.pi) * elapsed * 80)
	end
	if curStep > 4224 then
		setProperty('iconP2.scale.x', 1)
		setProperty('iconP2.scale.y', 1)
		setProperty('iconP2.offset.x', math.random(-1 * 4,1 * 4))
		setProperty('iconP2.offset.y', math.random(-1 * 4,1 * 4))
	end
end