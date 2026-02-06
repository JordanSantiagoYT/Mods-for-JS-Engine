function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "Adminarchy\n\nSong by TofpFL\n\nChart by Jordan Santiago", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 32, 'linear')
end
function onStepHit()
	if curStep == 1984 then
		doTweenAlpha('fadeThing1', 'flash', 1, (240/curBpm) * 2, 'linear')
	end
	if curStep == 2016 then
		doTweenAlpha('fadeThing2', 'flash', 0, (240/curBpm) * 2, 'linear')
	end
	if curStep == 2048 then
		doTweenY('creditTween', 'Credits', 250, (240/curBpm), 'expoOut')
	end
	if curStep == 2304 then
		doTweenY('creditTween', 'Credits', -420, (240/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (240/curBpm), 'linear')
	end
	if curStep == 6016 then
		doTweenAlpha('fadeThing3', 'flash', 1, (240/curBpm) * 4, 'linear')
	end
	if curStep == 6080 then
		doTweenAlpha('fadeThing4', 'flash', 0, (240/curBpm) * 4, 'linear')
	end
end
function onSectionHit()
	if curSection >= 652 and curSection < 656 then
		setProperty('flash.alpha', 0)
		doTweenAlpha('fadeBop', 'flash', 1, (240/curBpm), 'linear')
	end
	if curSection == 128 or curSection == 656 or curSection == 800 or curSection == 928 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
	end
	if curSection == 1184 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		clearEffects('camGame')
	end
	if curSection == 1376 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 80, 'linear')
	end
end
function onBeatHit()
	if curBeat >= 3184 and curBeat < 3200 or curBeat >= 3696 and curBeat < 3712 then
		setProperty('flash.alpha', curBeat % 2 == 0 and 0 or 1)
	end
end