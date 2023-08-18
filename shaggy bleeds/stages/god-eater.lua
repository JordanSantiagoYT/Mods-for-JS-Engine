function onCreate()
	-- background shit

	
	makeAnimatedLuaSprite('sky', 'god eater/god_bg',-850, -250);
      setLuaSpriteScrollFactor('sky', 0.1, 0.1);
	scaleObject('sky', 0.9, 0.8);

	
  makeAnimatedLuaSprite('techo', 'god eater/god_bg',1200, 800);
     setLuaSpriteScrollFactor('techo',0.95, 0.95);
	scaleObject('techo', 1, 1);
	
  makeAnimatedLuaSprite('techo2', 'god eater/god_bg',450, 700);
 
	scaleObject('techo2', 1.4, 1.3);

   
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
     makeAnimatedLuaSprite('bgcloud', 'god eater/god_bg',-730, -350);
     setLuaSpriteScrollFactor('bgcloud',0.3, 0.3);
	scaleObject('bgcloud', 0.9, 0.8);
	
	    makeAnimatedLuaSprite('fgcloud', 'god eater/god_bg',-1150, -450);
     setLuaSpriteScrollFactor('fgcloud',0.9, 0.9);
	scaleObject('fgcloud', 0.9, 0.8);
	
   makeAnimatedLuaSprite('rocas1', 'god eater/rocas1',-900, 0);
     setLuaSpriteScrollFactor('rocas1',0.9, 0.9);
	scaleObject('rocas1', 2.3, 2.0);
	
	end

	
    addLuaSprite('sky', false);
	addAnimationByPrefix('sky','idle','bg',30,true);
	 addLuaSprite('bgcloud', false);
	addAnimationByPrefix('bgcloud','idle','cloud_smol',30,true);
    addLuaSprite('fgcloud', false);
	addAnimationByPrefix('fgcloud','idle','cloud_big',30,true);
		 addLuaSprite('rocas1', false);
	addAnimationByPrefix('rocas1','idle','rocas1 idle',18,true);
	    addLuaSprite('techo', false);
	addAnimationByPrefix('techo','idle','rock',30,true);
 addLuaSprite('techo2', false);
	addAnimationByPrefix('techo2','idle','gf_rock',30,true);

end

function onUpdate(elapsed)

  if curStep >= 0 then

    songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(bpm/80)

    doTweenY(dadTweenY, 'dad', 300-110*math.sin((currentBeat*0.25)*math.pi),0.001)

  end

end