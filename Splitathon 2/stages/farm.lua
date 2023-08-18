sprs = {'boyfriendGroup', 'dadGroup', 'gfGroup'}
awesomeOffset = {40, -30}
awesomeScroll = 0.7
stupidIdiotLength = 50
function onCreate()
  luaDebugMode = true
  makeLuaSprite('sky_night', 'backgrounds/shared/sky_night', -600, -200)
  setScrollFactor('sky_night', 0.6, 0.6)
  addLuaSprite('sky_night')
  
  if songName:lower() ~= 'splitathon' then
    makeLuaSprite('sky_sunset', 'backgrounds/shared/sky_sunset', -600, -200)
    setScrollFactor('sky_sunset', 0.6, 0.6)
    setProperty('sky_sunset.color', getColorFromHex('FF8FB2'))
    addLuaSprite('sky_sunset')
    
    makeLuaSprite('skyer', 'backgrounds/shared/sky', -600, -200)
    setScrollFactor('skyer', 0.6, 0.6)
    addLuaSprite('skyer')
  end
  
  makeSpr('flatGrass', 'gm_flatgrass', 350, 75)
  scaleObject('flatGrass', 0.34, 0.34)
  setScrollFactor('flatGrass', 0.65, 0.65)
  add('flatGrass')
  
  makeSpr('hills', 'orangey hills', -173, 100)
  setScrollFactor('hills', 0.65, 0.65)
  add('hills')
  
  makeSpr('farmhouse', 'funfarmhouse', 100, 125)
  scaleObject('farmhouse', 0.9, 0.9)
  setScrollFactor('farmhouse', 0.7, 0.7)
  add('farmhouse')
  
  makeSpr('grass', 'grass lands', -600, 500)
  add('grass')
  
  makeSpr('cornFence', 'cornFence', -400, 200)
  add('cornFence')
  
  makeSpr('cornFence2', 'cornFence2', 1100, 200)
  add('cornFence2')
  
  makeSpr('sign', 'sign', 0, 350)
  add('sign')
  
  if songName:lower() == 'splitathon' then
    makeSpr('picnic_towel_thing', 'picnic_towel_thing', 1050, 650)
    add('picnic_towel_thing')
    
    addHaxeLibrary('Character')
    addHaxeLibrary('HealthIcon')
    runHaxeCode[[
      var FAKEdave = new Character(0, 225, 'dave-splitathon');
      FAKEdave.playAnim('what');
      FAKEdave.color = 0xFF878787;
      FAKEdave.visible = false;
      game.insert(PlayState.instance.members.indexOf(game.dadGroup), FAKEdave);
      game.modchartSprites.set('FAKEdave', FAKEdave);
      
      var FAKEbambi = new Character(0, 580, 'bambi-splitathon');
      FAKEbambi.playAnim('umWhatIsHappening');
      FAKEbambi.color = 0xFF878787;
      FAKEbambi.visible = false;
      game.add(FAKEbambi);
      game.modchartSprites.set('FAKEbambi', FAKEbambi);
    ]]
  end
  
  local bagType = getRandomInt(0, 1000) == 0 and 'popeye' or 'cornbag' --lmao i didnt know this was a thing
  
  makeSpr('corn', bagType, 1200, 550)
  add('corn')
  
  callOnLuas('setRatingSetting', {'offset', {50, -250}})
end
bambiAnim = 'umWhatIsHappening'
daveAnim = 'what'
function onBeatHit()
  if songName:lower() == 'splitathon' then
    runHaxeCode([[
      var dave = game.modchartSprites.get('FAKEdave');
      var bambi = game.modchartSprites.get('FAKEbambi');
      var curBeat = ]]..tostring(curBeat)..[[;
      
      if(curBeat % dave.danceEveryNumBeats == 0 && dave.animation.curAnim != null)
      {
        dave.playAnim(']]..daveAnim..[[', true);
      }
      if(curBeat % bambi.danceEveryNumBeats == 0 && bambi.animation.curAnim != null)
      {
        bambi.playAnim(']]..bambiAnim..[[', true);
      }
    ]])
  end
end
splitEvents = {
  [4750] = function()
    setProperty('dad.skipDance', true)
    playAnim('dad', 'scared')
    cameraShake('hud', 0.015, 313.04-309.78)
  end,
  [4800] = function()
    cameraFlash('camGame', 'FFFFFF', 1)
    setProperty('FAKEdave.visible', true)
    throwThatBitchInThere('bambi', 'dave')
  end,
  [4850] = function()
    updatevels = false
  end,
  [5824] = function()
    setProperty('FAKEdave.visible', false)
    setProperty('FAKEbambi.visible', true)
    daveAnim = 'happy'
  end,
  [6080] = function()
    setProperty('FAKEdave.visible', true)
    setProperty('FAKEbambi.visible', false)
    bambiAnim = 'yummyCornLol'
  end,
  [8384] = function()
    setProperty('FAKEdave.visible', false)
    setProperty('FAKEbambi.visible', true)
  end
}
function onStepHit()
  if songName:lower() == 'splitathon' then
    if splitEvents[curStep] ~= nil then
      splitEvents[curStep]()
    end
  end
end
function throwThatBitchInThere(what, who)
  --copy pasted from dnb with minor changes to work with psych
  runHaxeCode([[
    var guyWhoComesIn = ']]..what..[[';
    var guyWhoFliesOut = ']]..who..[[';
		if(game.modchartSprites.get('BAMBICUTSCENEICONHURHURHUR') != null)
		{
      game.modchartSprites.get('BAMBICUTSCENEICONHURHURHUR').kill();
			game.modchartSprites.get('BAMBICUTSCENEICONHURHURHUR').destroy();
      game.modchartSprites.remove('BAMBICUTSCENEICONHURHURHUR');
		}
    game.iconP2.changeIcon(guyWhoFliesOut);
    game.healthBar.createFilledBar(0xFF0F5FFF, 0xFF31B0D1);
    game.healthBar.updateBar();
		var BAMBICUTSCENEICONHURHURHUR = new HealthIcon(guyWhoComesIn, false);
		BAMBICUTSCENEICONHURHURHUR.y = game.healthBar.y - (BAMBICUTSCENEICONHURHURHUR.height / 2);
		game.add(BAMBICUTSCENEICONHURHURHUR);
		BAMBICUTSCENEICONHURHURHUR.cameras = [game.camHUD];
		BAMBICUTSCENEICONHURHURHUR.x = -100;
		FlxTween.linearMotion(BAMBICUTSCENEICONHURHURHUR, -100, BAMBICUTSCENEICONHURHURHUR.y, game.iconP2.x, BAMBICUTSCENEICONHURHURHUR.y, 0.3, true, {ease: FlxEase.expoInOut});
		new FlxTimer().start(0.3, function(tmr:FlxTimer = null) {
      BAMBICUTSCENEICONHURHURHUR.changeIcon(guyWhoFliesOut);
      game.iconP2.changeIcon(guyWhoComesIn);
      game.reloadHealthBarColors();
      game.modchartSprites.set('BAMBICUTSCENEICONHURHURHUR', BAMBICUTSCENEICONHURHURHUR);
      game.callOnLuas('FlingCharacterIconToOblivionAndBeyond', []);
    });
  ]])
end
stupidx = 0
stupidy = 0
updatevels = false
function FlingCharacterIconToOblivionAndBeyond()
  stupidx = -5
  stupidy = -5
  updatevels = true
end
function onUpdate(elapsed)
  if updatevels then
    stupidx = stupidx * 0.98
    stupidy = stupidy + elapsed * 6
    setProperty('BAMBICUTSCENEICONHURHURHUR.x', getProperty('BAMBICUTSCENEICONHURHURHUR.x') + stupidx)
    setProperty('BAMBICUTSCENEICONHURHURHUR.y', getProperty('BAMBICUTSCENEICONHURHURHUR.y') + stupidy)
  end
end
function onCreatePost()
  if songName:lower() == 'splitathon' then
    for k,tag in pairs(sprs) do
        setProperty(tag..'.color', getColorFromHex('0xFF878787'))
    end
  end
end
function onSongStart()
  if songName:lower() == 'maze' then
    for k,v in pairs(sprs) do
      doTweenColor(v..'_sunset', v, 'FF8FB2', stupidIdiotLength)
    end
    doTweenAlpha('fuckin', 'skyer', 0, stupidIdiotLength)
    runTimer('sunsetTween', stupidIdiotLength)
  end
end
function onEvent(n)
  if songName:lower() == 'splitathon' and n:lower() == 'change character' then
    setProperty('dad.color', getColorFromHex('0xFF878787'))
  end
end
function onTimerCompleted(tag)
  if tag == 'sunsetTween' then
    runTimer('fml', 0.01)
  end
  if tag == 'fml' then
    for k,v in pairs(sprs) do
      doTweenColor(v..'_sunset', v, '0xFF878787', stupidIdiotLength)
    end
    doTweenAlpha('sky_sunset', 'sky_sunset', 0, stupidIdiotLength)
  end
end
function makeSpr(tag, image, x, y)
  makeLuaSprite(tag, 'backgrounds/farm/'..image, x, y)
end
function add(tag)
  addLuaSprite(tag)
  table.insert(sprs, tag)
end