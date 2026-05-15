function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "The Freakiest Of Them All\n\nSong by BobbbyTheSecond\n\nChart by Jordan Santiago\n\nOpponent Sprites by Enzo Polis", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	makeLuaSprite('shakeAmt', '', 0, 0);
	setProperty('shakeAmt.visible',false)
  	addLuaSprite('shakeAmt',false);

	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	--doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 4, 'linear')
	cameraFlash('camOther', 'ffffff', 0.7)
	setProperty('flash.alpha', 0)
end

local anchorpos = {};
function onStepHit()
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
		setProperty('flash.alpha', 0)
	end
	if curStep == 304 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 624 then
		noteTweenX('dadStrumX', 0, -500, 0.3, 'quartIn')
		noteTweenX('dadStrumX1', 1, -500, 0.3, 'quartIn')
		noteTweenX('dadStrumX2', 2, -500, 0.3, 'quartIn')
		noteTweenX('dadStrumX3', 3, -500, 0.3, 'quartIn')
		noteTweenX('bfStrumX', 4, 415, 0.3, 'quartInOut')
		noteTweenX('bfStrumX1', 5, 525, 0.3, 'quartInOut')
		noteTweenX('bfStrumX2', 6, 635, 0.3, 'quartInOut')
		noteTweenX('bfStrumX3', 7, 745, 0.3, 'quartInOut')
		setObjectCamera('flash', 'camGame')
		setProperty('flash.alpha', 1)
	end
	if curStep == 640 or curStep == 896 or curStep == 1152 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curStep == 640 then
        	for i = 0,getProperty('strumLineNotes.length')-1 do 
	            xshake = getPropertyFromGroup('strumLineNotes', i, 'x')
	            yshake = getPropertyFromGroup('strumLineNotes', i, 'y')
	            table.insert(anchorpos, {xshake,yshake})
		end
		setProperty('shakeAmt.x', 5)
	end
	if curStep == 880 then
		setProperty('boyfriendCameraOffset[1]', 60)
		doTweenAlpha('WhereDad', 'dad', 0.4, (60/curBpm))
		doTweenX('shakeAmtFake', 'shakeAmt', 0, (60/curBpm), 'expoOut')
		setProperty('defaultCamZoom', 1.1)
	end
	if curStep == 896 then
		setProperty('dad.alpha', 1)
		setProperty('boyfriendCameraOffset[1]', 0)
		doTweenX('shakeAmtFake', 'shakeAmt', 10, (60/curBpm), 'expoOut')
		setProperty('defaultCamZoom', 0.85)
	end
	if curStep == 1024 then
		setProperty('shakeAmt.x', 7.5)
	end
	if curStep == 1088 then
		setProperty('shakeAmt.x', 5)
	end
	if curStep == 1120 then
		setProperty('shakeAmt.x', 2.5)
	end
	if curStep == 1136 then
		setProperty('shakeAmt.x', 0)
		setObjectCamera('flash', 'camOther')
	end
	if curStep == 1154 then
		noteTweenY('bfStrumY', 4, 760, (400/curBpm), 'expoIn')
		noteTweenY('bfStrumY1', 5, 760, (410/curBpm), 'expoIn')
		noteTweenY('bfStrumY2', 6, 760, (420/curBpm), 'expoIn')
		noteTweenY('bfStrumY3', 7, 760, (430/curBpm), 'expoIn')
	end
	if curStep == 1376 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 2, 'linear')
	end
end

shake = 0
resetStrums = false
function onUpdate(elapsed)
	if getProperty('shakeAmt.x') > 0 then
		shake = getProperty('shakeAmt.x')
		for i = 0,getProperty('strumLineNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
			setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
		end
	elseif not resetStrums then
		resetStrums = true
		for i = 0,getProperty('strumLineNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1])
			setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2])
		end
	end
end