
function onCreatePost()
    addHaxeLibrary('Std')
    addHaxeLibrary('Math')
    runHaxeCode([[
            ghostBF = new Character(game.boyfriend.x, game.boyfriend.y, 'bf-fg-back', true);
            game.add(ghostBF);
            game.variables.set('ghostBF',ghostBF);
            game.variables.set('ghostBFX',ghostBF.x);
	    ghostBF.alpha = 0;
    ]]);
    runHaxeCode([[
            ghostDad = new Character(-160, -270, 'cyrill-phase-2', false);
            game.addBehindDad(ghostDad);
            game.variables.set('ghostDad',ghostDad);
            game.variables.set('ghostDadX',ghostDad.x);
	    ghostDad.alpha = 0;
    ]]);
end
function onBeatHit()
    runHaxeCode([[
        if (]]..curBeat..[[ % ghostBF.danceEveryNumBeats == 0 && ghostBF.animation.curAnim != null && !StringTools.startsWith(ghostBF.animation.curAnim.name, 'sing') && !ghostBF.stunned)
        {
            ghostBF.dance();
        }
    ]])
    runHaxeCode([[
        if (]]..curBeat..[[ % ghostDad.danceEveryNumBeats == 0 && ghostDad.animation.curAnim != null && !StringTools.startsWith(ghostDad.animation.curAnim.name, 'sing') && !ghostDad.stunned)
        {
            ghostDad.dance();
        }
    ]])
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'No Animation' then
        	runHaxeCode([[
			var animToPlay:String = game.singAnimations[Std.int(Math.abs(]]..direction..[[))];
            		ghostBF.playAnim(animToPlay, true);
            		ghostBF.holdTimer = 0;
        	]])
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'No Animation' then
        	runHaxeCode([[
			var animToPlay:String = game.singAnimations[Std.int(Math.abs(]]..direction..[[))];
            		ghostDad.playAnim(animToPlay, true);
            		ghostDad.holdTimer = 0;
        	]])
	end
end

function onUpdatePost(elapsed)
    runHaxeCode([[
	for (char in [ghostBF, ghostDad])
        	if(char.holdTimer > Conductor.stepCrochet * (0.0011 / FlxG.sound.music.pitch) * char.singDuration && StringTools.startsWith(char.animation.curAnim.name, 'sing') && !StringTools.endsWith(char.animation.curAnim.name, 'miss')) {
			char.dance();
		} else char.holdTimer += ]]..elapsed..[[;
    ]])
end

function onStepHit()
	if curStep == 832 or curStep == 1088 then
		doTweenAlpha('ghostDadIn', 'ghostDad', 0.5, 0.2, 'linear')
		doTweenX('ghostDadXThing1', 'ghostDad', getProperty('ghostDadX') - 340, 0.4, 'expoOut')
	end
	if curStep == 896 or curStep == 1152 then
		doTweenAlpha('ghostDadOut', 'ghostDad', 0, 0.4, 'expoIn')
		doTweenX('ghostDadXThing2', 'ghostDad', getProperty('ghostDadX'), 0.4, 'expoIn')
	end
	if curStep == 960 or curStep == 1216 then
		doTweenAlpha('ghostBFIn', 'ghostBF', 0.5, 0.2, 'linear')
		doTweenX('ghostBFXThing1', 'ghostBF', getProperty('ghostBFX') + 200, 0.4, 'expoOut')
	end
	if curStep == 1024 or curStep == 1280 then
		doTweenAlpha('ghostBFOut', 'ghostBF', 0, 0.4, 'expoIn')
		doTweenX('ghostBFXThing2', 'ghostBF', getProperty('ghostBFX'), 0.4, 'expoIn')
	end
	if curStep == 1300 then -- remove the ghost character stuff, as they're not used anymore
		runHaxeCode([[
			game.remove(ghostBF);
			game.remove(ghostDad);
			game.variables.set('ghostBF',null);
			game.variables.set('ghostBFX',0);
			game.variables.set('ghostDad',null);
			game.variables.set('ghostDadX',0);
		]])
		close(true)
	end
end