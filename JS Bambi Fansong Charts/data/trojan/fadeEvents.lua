function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "TROJAN\n\nSong by silation20511\n\nChart by Jordan Santiago\n\nOpponent Sprites by Crustai", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	setProperty('camZoomingDecay', 4)

	--be sure to change the 'JS Bambi Fansong Charts' part if you use this in other songs! (creds to NRSM and TheLeerName)
	if not shadersEnabled then return end
	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
	initShaderHandler()
	initLuaShader("gray")
	addShadersOnCamera("camHUD",  {"gray"})
	addShadersOnCamera("camGame", {"gray"})
	setShaderValue('gray', 'grayIntensity', 1)
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 16, 'linear')
end

function onStepHit()
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, 0.7, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 0.7, 'linear')
	end
	if curStep == 1792 then
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenAlpha('fadeOut1', 'flash', 0.8, (240/curBpm) * 29)
	end
	if curStep == 2272 then
		doTweenAlpha('fadeIn1', 'flash', 0, (240/curBpm) * 2)
	end
	if curStep == 2304 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 4352 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 32)
	end
end