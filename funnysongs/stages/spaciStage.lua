
function onCreate()
	-- background shit
	makeLuaSprite('background', 'spaciBG', -1450, -700);
	addLuaSprite('background', false);
	scaleLuaSprite('background',2.7,2.7);
	setScrollFactor('background', 0, 0);
	addGlitchEffect('background', 1, 4)
	scaleObject('background', 4,4);

end
function onUpdate()
	songPos = getSongPosition()
	currentBeat = (songPos/1000)*(bpm/80)
	setProperty("gf.scale.x",0.3)
	setProperty("gf.scale.y",0.3)
	setProperty("gf.y",150+math.sin(currentBeat*math.pi/16)*200)
	setProperty("gf.x",-1500+math.fmod(currentBeat*100,3300))
	setProperty("gf.angle",currentBeat*10)
end