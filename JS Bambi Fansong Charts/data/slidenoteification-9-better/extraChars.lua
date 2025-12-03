function onCreatePost()
	luaDebugMode = true
	cameraForcedPos = false --im not going to be making the isCameraOnForcedPos variable public
	charFocus = 'bf'
    addHaxeLibrary('Std')
    addHaxeLibrary('Note')
	addHaxeLibrary('Math')
    addHaxeLibrary('EKData')
    runHaxeCode([[
            bandu = new Character(-100, -250, 'bandu-sad-playable', true);
            game.addBehindBF(bandu);
            game.variables.set('bandu',bandu);
    ]]);
    runHaxeCode([[
            dave = new Character(700, 50, 'splitathon-dave-playable', true);
            game.addBehindBF(dave);
            game.variables.set('dave',dave);
    ]]);
    runHaxeCode([[
            bambi = new Character(700, 50, 'bambi-playable', true);
            game.addBehindBF(bambi);
            game.variables.set('bambi',bambi);
    ]]);

	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Blammed Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bandu Sing' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Dave Sing' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bambi Sing' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bambi Sing (Alt)' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true)
		end
	end
end
function onBeatHit()
    runHaxeCode([[
        if (]]..curBeat..[[ % bandu.danceEveryNumBeats == 0 && bandu.animation.curAnim != null && !StringTools.startsWith(bandu.animation.curAnim.name, 'sing') && !bandu.stunned)
        {
            bandu.dance();
        }
    ]])
    runHaxeCode([[
        if (]]..curBeat..[[ % dave.danceEveryNumBeats == 0 && dave.animation.curAnim != null && !StringTools.startsWith(dave.animation.curAnim.name, 'sing') && !dave.stunned)
        {
            dave.dance();
        }
    ]])
    runHaxeCode([[
        if (]]..curBeat..[[ % bambi.danceEveryNumBeats == 0 && bambi.animation.curAnim != null && !StringTools.startsWith(bambi.animation.curAnim.name, 'sing') && !bambi.stunned)
        {
            bambi.dance();
        }
    ]])
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	charFocus = 'bf'
	if noteType == 'Bandu Sing' then
		charFocus = 'bandu'
        	runHaxeCode([[
			var animToPlay:String = game.singAnimations[Std.int(Math.abs(]]..direction..[[))];
            		bandu.playAnim(animToPlay, true);
            		bandu.holdTimer = 0;
        	]])
	end
	if noteType == 'Dave Sing' then
		charFocus = 'dave'
        	runHaxeCode([[
			var animToPlay:String = game.singAnimations[Std.int(Math.abs(]]..direction..[[))];
            		dave.playAnim(animToPlay, true);
            		dave.holdTimer = 0;
        	]])
	end
	if noteType == 'Bambi Sing' then
		charFocus = 'bambi'
        	runHaxeCode([[
			var animToPlay:String = game.singAnimations[Std.int(Math.abs(]]..direction..[[))];
            		bambi.playAnim(animToPlay, true);
            		bambi.holdTimer = 0;
        	]])
	end
	if noteType == 'Bambi Sing (Alt)' then
		charFocus = 'bambi'
        	runHaxeCode([[
			var animToPlay:String = game.singAnimations[Std.int(Math.abs(]]..direction..[[)) + '-alt'];
            		bambi.playAnim(animToPlay, true);
            		bambi.holdTimer = 0;
        	]])
	end
	if noteType == 'All Sing' then
		charFocus = 'all'
        	runHaxeCode([[
			for (char in [dave, bandu, bambi]) {
				var animToPlay:String = game.singAnimations[Std.int(Math.abs(]]..direction..[[))];

            			char.playAnim(animToPlay, true);
            			char.holdTimer = 0;
			}
        	]])
	end
end

function onUpdatePost(elapsed)
    runHaxeCode([[
	for (char in [dave, bandu, bambi])
        	if(char.holdTimer > Conductor.stepCrochet * (0.0011 / FlxG.sound.music.pitch) * char.singDuration && StringTools.startsWith(char.animation.curAnim.name, 'sing') && !StringTools.endsWith(char.animation.curAnim.name, 'miss')) {
			char.dance();
		} else char.holdTimer += ]]..elapsed..[[;
    ]])
	if getSongPosition() > crochet * 4 then
		if not mustHitSection then
			cameraForcedPos = false
			triggerEvent('Camera Follow Pos')
			cameraSetTarget('dad')
			setProperty('defaultCamZoom', 0.2)
		end
		if charFocus == 'bf' and mustHitSection and cameraForcedPos then
			cameraForcedPos = false
			triggerEvent('Camera Follow Pos')
			cameraSetTarget('bf')
		end
		if charFocus == 'dave' and mustHitSection then
			cameraForcedPos = true
			triggerEvent('Camera Follow Pos', 820, 420) --AHAHAHAHAHHA FUNNY NUMBER
		end
		if charFocus == 'bambi' and mustHitSection then
			cameraForcedPos = true
			triggerEvent('Camera Follow Pos', 840, 520)
		end
		if charFocus == 'bandu' and mustHitSection then
			cameraForcedPos = true
			triggerEvent('Camera Follow Pos', 460, 360)
		end
		if charFocus == 'all' and mustHitSection then
			cameraForcedPos = true
			triggerEvent('Camera Follow Pos', 700, 400)
			setProperty('defaultCamZoom', 0.65)
		end
	end
end