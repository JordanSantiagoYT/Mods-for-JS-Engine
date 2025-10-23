function onCreatePost()
	luaDebugMode = true
	cameraForcedPos = false --im not going to be making the isCameraOnForcedPos variable public
	charFocus = 'bf'
    addHaxeLibrary('Std')
    addHaxeLibrary('Note')
    addHaxeLibrary('Math')
    runHaxeCode([[
            dave = new Character(-100, 200, 'dave', false);
            game.add(dave);
            game.variables.set('dave',dave);
    ]]);

	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Blammed Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Dave Sing' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true)
		end
	end
end
function onBeatHit()
    runHaxeCode([[
        if (]]..curBeat..[[ % dave.danceEveryNumBeats == 0 && dave.animation.curAnim != null && !StringTools.startsWith(dave.animation.curAnim.name, 'sing') && !dave.stunned)
        {
            dave.dance();
        }
    ]])
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	charFocus = 'dad'
	if noteType == 'Dave Sing' or noteType == 'All Sing' then
		charFocus = 'dave'
        	runHaxeCode([[
			var animToPlay:String = game.singAnimations[Std.int(Math.abs(]]..direction..[[))];
            		dave.playAnim(animToPlay, true);
            		dave.holdTimer = 0;
        	]])
	end
end

function onUpdatePost(elapsed)
    runHaxeCode([[
        if(dave.holdTimer > Conductor.stepCrochet * (0.0011 / FlxG.sound.music.pitch) * dave.singDuration && StringTools.startsWith(dave.animation.curAnim.name, 'sing') && !StringTools.endsWith(dave.animation.curAnim.name, 'miss')) {
		dave.dance();
	} else dave.holdTimer += ]]..elapsed..[[;
    ]])
	if getSongPosition() > crochet * 4 then
		if not mustHitSection and cameraForcedPos then
			cameraForcedPos = false
			triggerEvent('Camera Follow Pos')
			cameraSetTarget('dad')
		end
		if charFocus == 'bf' and mustHitSection and cameraForcedPos then
			cameraForcedPos = false
			triggerEvent('Camera Follow Pos')
			cameraSetTarget('bf')
		end
		if charFocus == 'dave' and not mustHitSection then
			cameraForcedPos = true
			triggerEvent('Camera Follow Pos', 420, 570) --AHAHAHAHAHHA FUNNY NUMBER
		end
	end
end