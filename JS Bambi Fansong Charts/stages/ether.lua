	function onUpdate()
		songPos = getSongPosition()
		currentBeat = (songPos/1000)*(bpm/140)
		setProperty("background2.scale.x",0.9)
		setProperty("background2.scale.y",0.9)
		setProperty("background2.y",-600+math.sin(currentBeat*math.pi/16)*-100)
		setProperty("background2.x",-3100+math.fmod(currentBeat*300,3800))
		setProperty("background2.angle",currentBeat*0)

	end
	

function onCreate()
	-- background shit

	makeLuaSprite('background3', 'bamb/Bg_Stars', -800, -400);
	addLuaSprite('background3', false);
	scaleLuaSprite('background3',2.7,2.7);
	setScrollFactor('background3', 0, 0);
	addGlitchEffect('background3', 1, 9)
	scaleObject('background3', 1.5,1.5);

	makeLuaSprite('background2', 'bamb/Bg_Planet', -1600, -900);
	addLuaSprite('background2', false);
	scaleLuaSprite('background2',2.7,2.7);
	setScrollFactor('background2', 0, 0);
	scaleObject('background2', 1.5,1.5);

	makeLuaSprite('background1', 'bamb/Bg_Cubes', -800, -500);
	addLuaSprite('background1', false);
	scaleLuaSprite('background1', 0.2,0.2);
	setScrollFactor('background1', 0, 0);
	addGlitchEffect('background1', 1, 3)
	scaleObject('background1', 1,1);


end