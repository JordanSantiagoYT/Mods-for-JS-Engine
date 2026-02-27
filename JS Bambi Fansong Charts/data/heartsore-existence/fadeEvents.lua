local anchorpos = {};
function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Heartsore Existence\n\nSong by Null_y34r\n\nChart by Jordan Santiago\n\nSprites by TheTrueAccount_2", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaSprite('shakeAmt', '', 0, 0);
	setProperty('shakeAmt.visible', false)
  	addLuaSprite('shakeAmt',false);

	--shaders
	addVCREffect('camgame')

        for i = 0,getProperty('strumLineNotes.length')-1 do 
            xshake = getPropertyFromGroup('strumLineNotes', i, 'x')
            yshake = getPropertyFromGroup('strumLineNotes', i, 'y')
            table.insert(anchorpos, {xshake,yshake})
        end
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, (240/curBpm) * 24, 'linear')
end

function onStepHit()
	if curStep == 512 then
		doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
	end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', -360, 1.2, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1.2, 'linear')
	end
	if curStep == 1528 or curStep == 3064 then
		doTweenX('shakeIn', 'shakeAmt', 5, (120/curBpm), 'expoIn')
	end
	if curStep == 1536 or curStep == 3072 then
		cameraFlash('camOther', 'ffffff', 1)
		addBloomEffect('camGame', 0.2)
		addBloomEffect('camHUD', 0.1)
	end
	if curStep == 2048 then
		cameraFlash('camOther', 'ffffff', 1)
		clearEffects('camGame')
		addVCREffect('camGame')
		clearEffects('camHUD')
		setProperty('shakeAmt.x', 2.5)
		setProperty('flash.alpha', 1)
	end
	if curStep == 2112 then
		doTweenAlpha('flTwAgain', 'flash', 0, (240/curBpm) * 4, 'linear')
	end
	if curStep == 3584 then
		doTweenX('shakeIn', 'shakeAmt', 0, (240/curBpm) * 4, 'expoIn')
		cameraFlash('camOther', 'ffffff', 1)
		clearEffects('camGame')
		addVCREffect('camGame')
		clearEffects('camHUD')
	end
	if curStep == 4096 then
		doTweenAlpha('okBye', 'flash', 1, (240/curBpm) * 16, 'linear')
	end
end

local shake = 0
function onUpdate(elapsed)
	if getProperty('shakeAmt.x') > 0 then
		shake = getProperty('shakeAmt.x')
		for i = 0,getProperty('strumLineNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
			setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
		end
	end
end