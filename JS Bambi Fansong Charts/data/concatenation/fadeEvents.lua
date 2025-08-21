function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Concatenation\n\nSong by leppycolon3\n\nChart by Jordan Santiago\n\nTrue Expunged Sprites by Half_Joke", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	setProperty('dad.alpha', 0)

	--be sure to change the 'JS Bambi Fansong Charts' part if you use this in other songs! (creds to NRSM and TheLeerName)
    	if not shadersEnabled then return end
    	require("mods.JS Bambi Fansong Charts.scripts.ShaderHandler")
    	initShaderHandler()
    	initLuaShader("gray")
	addShadersOnCamera("camHUD",  {"gray"})
	addShadersOnCamera("camGame", {"gray"})
end

function onSongStart()
	doTweenAlpha('flashOut', 'flash', 0, 6, 'linear')
end

function onStepHit()
	if curStep == 256 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		setProperty('dad.alpha', 1)
		doTweenY('creditTween', 'Credits', 270, 2, 'expoOut')
	end
	if curStep == 384 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 1216 or curStep == 1760 then
		doTweenShaderValue('grayIn', 'gray', 'grayIntensity', 1, 0.4)
	end
	if curStep == 1264 or curStep == 1796 then
		doTweenShaderValue('grayOut', 'gray', 'grayIntensity', 0, 0.4)
	end
	if curStep == 4288 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 4, 'linear')
	end
end