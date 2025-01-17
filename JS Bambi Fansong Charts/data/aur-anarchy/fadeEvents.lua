function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaSprite('oppSprite', 'archAngry/madarchlinux', 0, 400);
	scaleObject('oppSprite', 0.2, 0.2);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 32, 'linear')
	doTweenY('creditTween', 'Credits', 280, 2, 'expoOut')
end

function onStepHit()
	if curStep == 1536 then
		cameraFlash('camOther', 'ffffff', 0.5)
		setProperty('oppSprite.alpha', 0)
	end
	if curStep == 1792 then
		cameraFlash('camOther', 'ffffff', 0.5)
		setProperty('oppSprite.alpha', 1)
		setProperty('dad.angle', 0)
	end
	if curStep == 2816 then
		setProperty('flash.alpha', 1)
	end
	if curStep == 2944 then
		cameraFlash('camOther', 'ffffff', 0.5)
		setProperty('flash.alpha', 0)
	end
	if curStep == 3584 then
		doTweenAlpha('fadeOut', 'flash', 1, 6.4, 'linear')
	end
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if dadName == 'mattangry' then
	setProperty('dad.angle', getRandomInt(-360, 360))
    end
end