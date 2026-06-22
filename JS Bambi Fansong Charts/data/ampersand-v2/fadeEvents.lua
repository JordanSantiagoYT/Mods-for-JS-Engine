function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "& (V2)\n\nComposed by Null_y34r\n\nChart by Jordan Santiago\n\nOpponent Sprites by MrLambiLOL", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')

	setProperty('camZoomingDecay', 2.5)
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 8, 'linear')
end
function onStepHit()
	if curStep == 248 then
		doTweenAlpha('fadeNo', 'flash', 1, (110/curBpm), 'linear')
	end
	if curStep == 256 then
		setProperty('flash.alpha', 0)
		cameraFlash('camOther', 'ffffff', 0.7)
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 320 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 504 or curStep == 764 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fadeWhoops', 'flash', 1, (60/curBpm), 'expoOut')
	end
	if curStep == 508 then
		doTweenAlpha('fadeWhoops', 'flash', 0, (60/curBpm), 'expoIn')
	end
	if curStep == 512 or curStep == 1024 then
		setObjectCamera('flash', 'camOther')
	end
	if curStep == 764 then
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('fadeWhoops', 'flash', 1, (30/curBpm), 'expoOut')
	end
	if curStep == 766 then
		doTweenAlpha('fadeWhoops', 'flash', 0.5, (20/curBpm), 'expoIn')
	end
	if curStep == 768 then
		setProperty('flash.alpha', 0.8)
		doTweenAlpha('fadeWhoops', 'flash', 0, (240/curBpm) * 8, 'linear')
	end
	if curStep == 1920 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 8, 'linear')
	end
end