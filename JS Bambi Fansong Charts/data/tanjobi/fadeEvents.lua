function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Tanjobi\n\nSong by SuperScratchSpyro\n\nChart by Jordan Santiago\n\nOpponent Sprites by Enzo Polis", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	setProperty('dad.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('FlxG.camera.zoom', 2)
	setProperty('defaultCamZoom', 2)
	setProperty('camZooming', true)
end

function onSongStart()
	doTweenAlpha('fadeIn', 'flash', 0, (240/curBpm) * 15, 'linear')
	zoomTwnWorkaround(1.0, (240/curBpm) * 6, 'expoOut') --i have to make my own function because calling triggerEvent seems to not call onEvent
end

function onStepHit()
	if curStep == 248 then
		doTweenAlpha('noLol', 'flash', 1, (110/curBpm), 'linear')
	end
	if curStep == 256 then
   	     	cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		zoomTwnWorkaround(0.6, (240/curBpm), 'expoOut')
	     	setProperty('dad.alpha', 1)
	     	setProperty('iconP2.alpha', 1)
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 736 then
		doTweenAlpha('fadeFunky', 'flash', 0.9, (240/curBpm), 'quadOut')
	end
	if curStep == 752 then
		doTweenAlpha('fadeFunky2', 'flash', 0, (240/curBpm), 'quadIn')
	end
	if curStep == 2432 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
end

function zoomTwnWorkaround(zoom, time, ease)
	doTweenZoom("camGameZoom", "camGame", zoom, time, ease)
	setProperty('defaultCamZoom', zoom)
end