function onCreatePost()
	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash', 1280, 720, '000000')
	addLuaSprite('flash', true);
	setLuaSpriteScrollFactor('flash', 0, 0)
	setProperty('flash.scale.x', 2)
	setProperty('flash.scale.y', 2)
	setObjectCamera('flash', 'camOther')

	makeLuaText('Credits', "The Goddess of Larp\n\nSong by serialkidd\n\nChart by Jordan Santiago\n\nOpponent Sprites & BG by Nael2xd", 1250, 0, 720)
	setTextAlignment('Credits', 'Center')
	addLuaText('Credits')
	setTextSize('Credits', 40)
	setObjectCamera('Credits', 'camOther')
	setTextBorder('Credits', 3, '000000')
	setProperty('ytWatermark.alpha', 0)
	setProperty('dad.singDuration', 16)
	setProperty('boyfriend.singDuration', 16)

	runHaxeCode('setVar("twisted", false);')
end

function onSongStart()
	doTweenAlpha('fadeIntro', 'flash', 0, (240/curBpm) * 28, 'linear')
end
function onStepHit()
	if curStep == 960 then
		danielaBGShit('in')
	end
	if curStep == 1024 then
		cameraFlash('camOther', 'ffffff', 0.7)
		setProperty('flash.alpha', 0)
		danielaBGShit('start')
		doTweenY('creditTween', 'Credits', 250, (480/curBpm), 'expoOut')
	end
	if curStep == 1152 then
		doTweenY('creditTween', 'Credits', -420, (480/curBpm), 'expoIn')
		doTweenAlpha('ytWatermarkIn', 'ytWatermark', 0.5, (480/curBpm), 'linear')
	end
	if curStep == 2048 then
		danielaBGShit('panUpward')
	end
	if curStep == 3840 then
		doTweenAlpha('fadeOut', 'flash', 1, (240/curBpm) * 16, 'linear')
	end

	if curStep >= 1024 and curStep < 2048 and curStep % 16 == 0 then
		danielaBGShit('bop')
		danielaBGShit('angleBop')
	end
	if curStep >= 2048 and curStep < 3584 and curStep % 32 == 0 then
		danielaBGShit('angleBop2')
	end 
	if curStep == 3520 then
		danielaBGShit('out')
	end
end

function onEvent(n,v1,v2)
	if n == 'Change Character' then
		setProperty('dad.singDuration', 16)
		setProperty('boyfriend.singDuration', 16)
	end
end

local twisted = false
function danielaBGShit(type)
	runHaxeCode([[
		var danielings = getVar('danielas');
		switch ("]]..type..[[") {
			case 'start':
			danielings.velocity.x = -300;

			case 'panUpward':
			danielings.velocity.y = -300;
			
			case 'stopPan':
			danielings.velocity.y = 0;

			case 'bop':
			if (getVar('danielingsTween') != null) {
				getVar('danielingsTween').cancel();
				getVar('danielingsTween').destroy();
				removeVar('danielingsTween');
			}
			
			setVar('danielingsTween', FlxTween.tween(danielings, {y: danielings.y - 398}, 240/Conductor.bpm, {ease: FlxEase.expoOut,
				onComplete: function(twn:FlxTween) {
					removeVar('danielingsTween');
				}
			}));

			case 'angleBop', 'angleBop2':
			var twist = getVar('twisted');
			setVar('twisted', !twist);
			danielings.angle = (getVar('twisted') ? 30 : -30);
			if (getVar('daAngle') != null) {
				getVar('daAngle').cancel();
				getVar('daAngle').destroy();
				removeVar('daAngle');
			}
			
			setVar('daAngle', FlxTween.tween(danielings, {angle: 0}, ("]]..type..[[" == 'angleBop' ? 240 : 480) / Conductor.bpm, {ease: FlxEase.expoOut,
				onComplete: function(twn:FlxTween) {
					removeVar('daAngle');
				}
			}));

			case 'in', 'out':
			if (getVar('danielingsIntro') != null) {
				getVar('danielingsIntro').cancel();
				getVar('danielingsIntro').destroy();
				removeVar('danielingsIntro');
			}
			
			setVar('danielingsIntro', FlxTween.tween(danielings, {alpha: ("]]..type..[[" == 'in' ? 0.6 : 0)}, 960/Conductor.bpm, {ease: FlxEase.linear,
				onComplete: function(twn:FlxTween) {
					removeVar('danielingsIntro');
				}
			}));
		}
	]])
end