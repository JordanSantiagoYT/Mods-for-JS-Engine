
function onCreatePost()
    addHaxeLibrary('Std')
    addHaxeLibrary('Math')
    runHaxeCode([[
            ghostBF = new Character(game.boyfriend.x, game.boyfriend.y, 'azzy-bf', true);
            game.addBehindBF(ghostBF);
            game.variables.set('ghostBF',ghostBF);
            game.variables.set('ghostBFX',ghostBF.x);
	    ghostBF.setColorTransform(0, 0, 0, 1, game.boyfriend.healthColorArray[0], game.boyfriend.healthColorArray[1], game.boyfriend.healthColorArray[2], 0);
		ghostBF.alpha = 0;
    ]]);
    runHaxeCode([[
            ghostBambi = new Character(80, 80, 'screwedguy', false);
            game.addBehindDad(ghostBambi);
            game.variables.set('ghostBambi',ghostBambi);
            game.variables.set('ghostBambiX',ghostBambi.x);
	    ghostBambi.setColorTransform(0, 0, 0, 1, game.dad.healthColorArray[0], game.dad.healthColorArray[1], game.dad.healthColorArray[2], 0);
		ghostBambi.alpha = 0;
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
        if (]]..curBeat..[[ % ghostBambi.danceEveryNumBeats == 0 && ghostBambi.animation.curAnim != null && !StringTools.startsWith(ghostBambi.animation.curAnim.name, 'sing') && !ghostBambi.stunned)
        {
            ghostBambi.dance();
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
            		ghostBambi.playAnim(animToPlay, true);
            		ghostBambi.holdTimer = 0;
        	]])
	end
end

function onUpdatePost(elapsed)
    runHaxeCode([[
	for (char in [ghostBF, ghostBambi])
        	if(char.holdTimer > Conductor.stepCrochet * (0.0011 / FlxG.sound.music.pitch) * char.singDuration && StringTools.startsWith(char.animation.curAnim.name, 'sing') && !StringTools.endsWith(char.animation.curAnim.name, 'miss')) {
			char.dance();
		} else char.holdTimer += ]]..elapsed..[[;
    ]])
end

function onStepHit()
	if curStep == 816 or curStep == 1072 then
		doTweenAlpha('ghostBambIn', 'ghostBambi', 0.5, 0.2, 'linear')
		doTweenX('ghostBambXThing1', 'ghostBambi', getProperty('ghostBambiX') - 100, 0.4, 'expoOut')
	end
	if curStep == 832 or curStep == 1088 then
		doTweenAlpha('ghostBambOut', 'ghostBambi', 0, 0.4, 'expoIn')
		doTweenX('ghostBambXThing2', 'ghostBambi', getProperty('ghostBambiX'), 0.4, 'expoIn')
	end
	if curStep == 880 or curStep == 1136 then
		doTweenAlpha('ghostBFIn', 'ghostBF', 0.5, 0.2, 'linear')
		doTweenX('ghostBFXThing1', 'ghostBF', getProperty('ghostBFX') + 100, 0.4, 'expoOut')
	end
	if curStep == 896 or curStep == 1152 then
		doTweenAlpha('ghostBFOut', 'ghostBF', 0, 0.4, 'expoIn')
		doTweenX('ghostBFXThing2', 'ghostBF', getProperty('ghostBFX'), 0.4, 'expoIn')
	end

	if curStep == 1024 then
		runHaxeCode([[
			ghostBF.setColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
			ghostBambi.setColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
			ghostBF.alpha = ghostBambi.alpha = 0;
		]])
	end
	if curStep == 1280 then -- remove the ghost character stuff, as they're not used anymore
		runHaxeCode([[
			game.remove(ghostBF);
			game.remove(ghostBambi);
			game.variables.set('ghostBF',null);
			game.variables.set('ghostBFX',0);
			game.variables.set('ghostBambi',null);
			game.variables.set('ghostBambiX',0);
		]])
		close(true)
	end
end