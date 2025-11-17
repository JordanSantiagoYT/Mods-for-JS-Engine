local loadPercent = '0'
local ffmpeg = false

function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Unsainted\n\nSong by Monroe14\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	ffmpeg = getPropertyFromClass('ClientPrefs', 'ffmpegMode')

	makeLuaText('Misc', "Loading " .. (ffmpeg and 'Video' or 'Chart') .. ".\n".. loadPercent .. "%", 1250, 0, 320)
	setTextAlignment('Misc', 'Center')
	addLuaText('Misc')
	setProperty('Misc.alpha', 0)
	setTextSize('Misc', 60)
	setObjectCamera('Misc', 'camOther')
	setTextBorder('Misc', 3, '000000')
end

function onSongStart()
	doTweenAlpha('loadIn', 'Misc', 1, 1, 'expoOut')
	setTextColor('Misc', 'ffffff')
end

loadValues = { {23, 12}, {25, 20}, {28, 34}, {31, 42}, {39, 51}, {48, 60}, {52, 'SIX SEVEN!!!'}, {53, 67}, {57, 70}, {63, 78}, {72, 86}, {78, 93}, {80, 100} }
function onStepHit()
	if curStep < loadValues[#loadValues][2] then
		for i = 1, #loadValues do
			if curStep == loadValues[i][1] then
				loadPercent = loadValues[i][2]
				setTextString('Misc', "Loading " .. (ffmpeg and 'Video' or 'Chart') .. ".\n".. loadPercent .. "%")
				break
			end
		end
	end
	if curStep == 80 then
		setTextColor('Misc', '00FF00')
		doTweenAlpha('loadOut', 'Misc', 0, 1.6, 'expoOut')
	end
	if curStep == 128 then
		doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 7, 'linear')
	end
	if curStep == 256 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 304 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1264 then
		doTweenAlpha('fadeCool1', 'flash', 0.8, (120/curBpm), 'expoOut')
	end
	if curStep == 1272 then
		doTweenAlpha('fadeCool2', 'flash', 0, (120/curBpm), 'expoOut')
	end
	if curStep == 1280 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 3072 then
		setProperty('flash.alpha', 1)
		cameraFlash('camOther', 'ffffff', 0.7)
	end
	if curStep == 3136 then
		setTextColor('Misc', 'FFFFFF')
		setTextString('Misc', "SMALL ENCORE!")
		doTweenAlpha('miscIn', 'Misc', 1, (240/curBpm), 'expoOut')
	end
	if curStep >= 3136 and curStep <= 3160 and curStep % 8 == 0 then
		setProperty('Misc.scale.x', 1.125)
		setProperty('Misc.scale.y', 1.125)
		doTweenScale('miscBounceOut', 'Misc', 1, (120/curBpm), 'expoOut')
	end
	if curStep == 3168 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('Misc.alpha', 0)
	end
	if curStep == 3200 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 22, 'linear')
	end
end