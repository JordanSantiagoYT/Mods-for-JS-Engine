function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaSprite('oppSprite', 'WillAnderson', 100, 500);
	scaleObject('oppSprite', 2, 2);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 14, 'linear')
end

function onStepHit()
	if curStep == 1664 then
		doTweenAlpha('fadeOut', 'flash', 1, 16.9, 'linear')
	end
end