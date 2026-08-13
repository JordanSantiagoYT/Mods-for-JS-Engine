function onCreate()
	initLuaShader('BlackAndBlue');
	setSpriteShader('dad', 'BlackAndBlue');
	setShaderBool('dad', 'invert', true)
	setProperty('dad.healthColorArray', {0, 102, 255})
end

function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Disinclination\n\nSong by Null_y34r\n\nChart by Jordan Santiago", 1250, 0, 740)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 16, 'linear')
end
function onStepHit()
	if curStep == 256 then
		doTweenY('creditTween', 'Credits', 240, (240/curBpm), 'expoOut')
	end
	if curStep == 304 then
		doTweenY('creditTween', 'Credits', -480, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 1664 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
end