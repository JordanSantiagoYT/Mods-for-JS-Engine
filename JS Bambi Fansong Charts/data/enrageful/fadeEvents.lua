function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Enrageful\n\nSong by ThatPizzaTowerFan\n\nChart by Jordan Santiago\n\nOpponent Sprites by DxrkPxwer", 1250, 0, 740)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	makeLuaText('Misc', "Bitch.", 1250, 0, 0)
	setTextAlignment('Misc', 'Center')
	addLuaText('Misc')
	setProperty('Misc.alpha', 0)
	setTextSize('Misc', 60)
	setObjectCamera('Misc', 'camOther')
	setTextBorder('Misc', 3, '000000')
	screenCenter('Misc')

	setProperty('camZoomingDecay', 2.5)

    	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
    	initShaderHandler()
    	initLuaShader("adjustColor")
    	initLuaShader("gray")
	addShadersOnCamera("camHUD",  {"gray", "adjustColor"})
	addShadersOnCamera("camGame", {"gray", "adjustColor"})
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 6, 'linear')
end
function onStepHit()
	if curStep == 128 then
		doTweenY('creditTween', 'Credits', 240, (480/curBpm), 'expoOut')
	end
	if curStep == 176 then
		doTweenY('creditTween', 'Credits', -480, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 640 then
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 1, 0.6, 'expoOut')
	end
	if curStep == 672 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setShaderValue('gray', 'grayIntensity', 0)
	end
	if curStep == 928 then
		doTweenAlpha('fade1', 'flash', 0.6, (60/curBpm), 'expoOut')
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 1, (60/curBpm), 'expoOut')
	end
	if curStep == 952 then
		doTweenAlpha('fade2', 'flash', 0, (240/curBpm), 'quadInOut')
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 0, (240/curBpm), 'quadInOut')
	end
	if curStep == 1184 then
		coolPart = true
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 1456 then
		setProperty('flash.alpha', 1)
		setProperty('Misc.alpha', 1)
	end
	if curStep == 1328 then
		coolPart = false
	end
	if curStep == 1472 then
		doTweenAlpha('fadeOut', 'Misc', 0, (240/curBpm), 'linear')
	end
end

coolPart = false
function onUpdate(elapsed)
	if coolPart then
    		setShaderValue('adjustColor', 'hue', (getSongPosition() / 1000) / (240 / curBpm) * 360 % 360)
	else setShaderValue("adjustColor",'hue', 0)
	end
end