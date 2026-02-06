ogBFY = 0
crazySpin = false
angleSpin = 0
angleSpeed = 240

function onCreatePost()
	ogBFY = getProperty('boyfriend.y')
	runHaxeCode([[
		game.iconP2.changeIcon(game.boyfriend.healthIcon);
		game.iconP1.changeIcon(game.dad.healthIcon);
		game.iconP1.flipX = true;
		game.reloadHealthBarColors(game.boyfriend.healthColorArray, game.dad.healthColorArray);
	]])
end
function onSongStart()
	noteTweenX('oppStrumBack0', 0, defaultPlayerStrumX0, 0.1, 'expoOut')
	noteTweenX('oppStrumBack1', 1, defaultPlayerStrumX1, 0.1, 'expoOut')
	noteTweenX('oppStrumBack2', 2, defaultPlayerStrumX2, 0.1, 'expoOut')
	noteTweenX('oppStrumBack3', 3, defaultPlayerStrumX3, 0.1, 'expoOut')
	noteTweenX('bfStrumBack0', 4, defaultOpponentStrumX0, 0.1, 'expoOut')
	noteTweenX('bfStrumBack1', 5, defaultOpponentStrumX1, 0.1, 'expoOut')
	noteTweenX('bfStrumBack2', 6, defaultOpponentStrumX2, 0.1, 'expoOut')
	noteTweenX('bfStrumBack3', 7, defaultOpponentStrumX3, 0.1, 'expoOut')
end
function onUpdate(elapsed)
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/240)
	doTweenY('opponentmove', 'dad', 500 - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
	doTweenY('bfMove', 'boyfriend', ogBFY - 100*math.sin((currentBeat*0.75)*math.pi), 0.05)
	setProperty('plat.y', getProperty('boyfriend.y'))
	cameraSetTarget((mustHitSection and 'bf' or 'dad'))
	runHaxeCode([[
		game.displayedHealth = game.maxHealth - game.health;
	]])

	if crazySpin then
        	angleSpin = angleSpin + angleSpeed * elapsed
		setProperty('camGame.angle', angleSpin % 360)
	elseif angleSpin > 0 then
		angleSpin = 0
		setProperty('camGame.angle', 0)
	end
end
function onSectionHit()
	if curSection == 928 then
		crazySpin = true; angleSpeed = 480;
	end
	if curSection == 1184 then
		crazySpin = false;
	end
end