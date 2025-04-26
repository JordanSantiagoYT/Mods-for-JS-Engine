local anchorpos = {};
local shake = 3;
function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Infected\n\nSong by Monroe14\n\nChart by Jordan Santiago\n\nOpponent Sprites by suziemitch_", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)

	makeLuaSprite('whiteBG', '', 0, 0)
 	makeGraphic('whiteBG', screenWidth, screenHeight, 'FFFFFF')
 	setObjectOrder('whiteBG', 1)
  	addLuaSprite('whiteBG', true)
  	setLuaSpriteScrollFactor('whiteBG', 0, 0)
   	setProperty('whiteBG.scale.x', 3)
  	setProperty('whiteBG.scale.y', 3)
  	setProperty('whiteBG.alpha', 0)
  	setObjectCamera('whiteBG', 'camGame')
	setObjectOrder('whiteBG', getObjectOrder('boyfriendGroup') - 1)

        for i = 0,3 do 
            xshake = getPropertyFromGroup('strumLineNotes', i, 'x')
            yshake = getPropertyFromGroup('strumLineNotes', i, 'y')
            table.insert(anchorpos, {xshake,yshake})
        end
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 15, 'linear')
end

canBlack = false
function onStepHit()
	setProperty('camZoomingDecay', 4 / (getProperty('camBopInterval')))
	if curStep == 128 then cameraFlash('camOther', 'FFFFFF', 0.4) end
	if curStep == 576 then
		doTweenY('creditTween', 'Credits', 250, 2, 'expoOut')
	end
	if curStep == 640 then
		doTweenY('creditTween', 'Credits', -420, 1, 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, 1, 'linear')
	end
	if curStep == 3456 then
		doTweenAlpha('fadeOut', 'flash', 1, 9, 'linear')
	end
	if curStep == 576 or curStep == 896 or curStep == 1024 then
		canBlack = true
	end
	if curStep == 848 or curStep == 976 or curStep == 1084 then
		canBlack = false
	end

	--Bambi gets fully infected here, so we shake the notes more
	if curStep == 2912 then shake = 6 end

	if curStep == 3424 then
		setProperty('whiteBG.alpha', 1)
		setProperty('camHUD.alpha', 0.001)
		setProperty('camZooming', false)
		setProperty('cameraSpeed', 100)
	end
	if curStep == 3440 then
		setProperty('cameraSpeed', 1)
	end
	if canBlack and curStep % 8 == 0 then
		setProperty('flash.alpha', 0.9)
		doTweenAlpha('fadeOut', 'flash', 0, 0.34, 'linear')
		setProperty('camTwistIntensity', 4)
		setProperty('camTwistIntensity2', 4)
		runHaxeCode('game.doTwist();')
	end
	if curStep == 856 or curStep == 984 or curStep == 1560 then
		doTweenAngle('gameSpin', 'camGame', 360, 1, 'expoInOut')
	end
	if curStep == 1088 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fadeIn', 'flash', 1, 1.02, 'linear')
	end
	if curStep == 1104 then
		doTweenAlpha('fadeIn', 'flash', 0, 1.02, 'linear')
	end
	if curStep == 1120 then
		cameraFlash('camOther', 'FFFFFF', 0.7)
		setObjectCamera('flash', 'camOther')
	end
end

function onUpdate(elapsed)
	if curStep > 576 and curStep < 1760 or curStep >= 2048 then
        	for i = 0,3 do
           		setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
            		setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
       		end
	end
end

function onTweenCompleted(t)
	if t == 'gameSpin' then setProperty('camGame.angle', 0) end
end