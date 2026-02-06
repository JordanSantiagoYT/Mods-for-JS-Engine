function onCreatePost()
	luaDebugMode = true
	cameraForcedPos = false --im not going to be making the isCameraOnForcedPos variable public
	charFocus = 'bf'
    addHaxeLibrary('Std')
    addHaxeLibrary('Note')
    addHaxeLibrary('Math')
    runHaxeCode([[
            bambi = new Character(900, 140, 'bambi-playable', true);
            game.add(bambi);
            game.variables.set('bambi',bambi);
    ]]);

	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bambi Sing' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Break Phone Note' and getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true)
		end
	end
	setProperty('bambi.alpha', 0)
end
function onBeatHit()
    runHaxeCode([[
        if (]]..curBeat..[[ % bambi.danceEveryNumBeats == 0 && bambi.animation.curAnim != null && !StringTools.startsWith(bambi.animation.curAnim.name, 'sing') && !bambi.stunned)
        {
            bambi.dance();
        }
    ]])
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	charFocus = 'bf'
	canAnim = not isSustainNote or getPropertyFromClass('ClientPrefs', 'oldSusStyle')

	if noteType == 'Bambi Sing' or noteType == 'All Sing' then
		charFocus = 'bambi'
		if canAnim then
        		runHaxeCode([[
				var animToPlay:String = game.singAnimations[Std.int(Math.abs(]]..direction..[[))];
            			bambi.playAnim(animToPlay, true);
        		]])
		end
		setProperty('bambi.holdTimer', 0)
	end
    	if noteType == 'Break Phone Note' then
		setProperty('bambi.holdTimer', 0)
        	runHaxeCode('bambi.playAnim("phoneSmash", true);')
		setProperty('bambi.specialAnim', true)
    	end
end

function onUpdatePost(elapsed)
    runHaxeCode([[
        if(bambi.holdTimer > Conductor.stepCrochet * (0.0011 / FlxG.sound.music.pitch) * bambi.singDuration && StringTools.startsWith(bambi.animation.curAnim.name, 'sing') && !StringTools.endsWith(bambi.animation.curAnim.name, 'miss')) {
		bambi.dance();
	} else bambi.holdTimer += ]]..elapsed..[[;
    ]])
end