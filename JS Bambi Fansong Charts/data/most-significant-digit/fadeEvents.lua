function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaSprite('oppSprite', 'msdAssets/hidden bambi 1', -100, 300);
	scaleObject('oppSprite', 2, 2);
    	setScrollFactor('oppSprite', 1, 1);
	addLuaSprite('oppSprite', false);
	setProperty('oppSprite.alpha', 1);
	makeLuaSprite('oppSprite2', 'msdAssets/hidden bambi 2', -100, 300);
	scaleObject('oppSprite2', 2, 2);
    	setScrollFactor('oppSprite2', 1, 1);
	addLuaSprite('oppSprite2', false);
	setProperty('oppSprite2.alpha', 0);
end

function onSongStart()
	doTweenAlpha('flTw', 'flash', 0, 19, 'linear')
end

function onStepHit()
	if curStep == 768 or curStep == 2048 then
		setProperty('oppSprite.alpha', 0)
		setProperty('oppSprite2.alpha', 1)
	end
	if curStep == 1280 or curStep == 2560 then
		setProperty('oppSprite.alpha', 1)
		setProperty('oppSprite2.alpha', 0)
	end
	if curStep == 2688 then
		doTweenAlpha('okBye', 'flash', 1, 10, 'linear')
	end
end