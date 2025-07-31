function onCreate()
  
   makeLuaSprite('sunset','skippaBG/madagascar/limoSunset',-300,-100)
   addLuaSprite('sunset',false)
   setScrollFactor('sunset', 0, 0)
   setProperty('sunset.visible', true)
   
   makeLuaSprite('sunsetred','skippaBG/madagascarS/limoSunset',-700,-300)
   addLuaSprite('sunsetred',false)
   setScrollFactor('sunset', 0.3, 0.3);
   scaleObject('sunsetred', 1.5, 1.5)
   setProperty('sunsetred.visible', false)
   
    makeAnimatedLuaSprite('street','skippaBG/madagascar/Road',-900,830)
    addAnimationByPrefix('street','anim','Road',24,true)
    addLuaSprite('street',false)
    objectPlayAnimation('street','anim',false)
    setProperty('street.visible', true)
    
    makeAnimatedLuaSprite('streetcool','skippaBG/madagascarS/Road',-900,830)
    addAnimationByPrefix('streetcool','anim','Road instance',24,true)
    addLuaSprite('streetcool',false)
    objectPlayAnimation('streetcool','anim',false)
    setProperty('streetcool.visible', false)
    
    makeLuaSprite('theTree','skippaBG/madagascar/Tree',-1900,0)
    addLuaSprite('theTree',false)
    setScrollFactor('theTree', 1, 0);
    setProperty('theTree.visible', true)
   
    makeAnimatedLuaSprite('car1','skippaBG/madagascar/Shitty_Jeep',-700,750)
    addAnimationByPrefix('car1','anim','Shitty Jeep',24,true)
    addLuaSprite('car1',false)
    objectPlayAnimation('car1','anim',false)
    setProperty('car1.visible', true)
    
    makeAnimatedLuaSprite('car2','skippaBG/madagascar/Shitty_Jeep',500,790)
    addAnimationByPrefix('car2','anim','Shitty Jeep',24,true)
    addLuaSprite('car2',false)
    objectPlayAnimation('car2','anim',false)
    setProperty('car2.visible', true)
    
    makeLuaSprite('rico','skippaBG/madagascar/Rico',-400,850)
    addLuaSprite('rico',false)
    setProperty('rico.visible', true)
    
    makeLuaSprite('kowalski','skippaBG/madagascar/Kowalski',-50,850)
    addLuaSprite('kowalski',false)
    setProperty('kowalski.visible', true)
    
    makeLuaSprite('private','skippaBG/madagascar/Private',-150,850)
    addLuaSprite('private',false)
    setProperty('private.visible', true)
    
    makeLuaSprite('demon','skippaBG/madagascar/Demon_Driver',900,850)
    addLuaSprite('demon',false)
    setProperty('demon.visible', true)
    
    makeAnimatedLuaSprite('car1better','skippaBG/madagascarS/Better_Jeep',-700,750)
    addAnimationByPrefix('car1better','anim','Truck',24,true)
    addLuaSprite('car1better',false)
    objectPlayAnimation('car1better','anim',false)
    setProperty('car1better.visible', false)
    
    makeAnimatedLuaSprite('car2better','skippaBG/madagascarS/Better_Jeep_BF',500,790)
    addAnimationByPrefix('car2better','anim','Truck Low Quality',24,true)
    addLuaSprite('car2better',false)
    objectPlayAnimation('car2better','anim',false)
    setProperty('car2better.visible', false)
end

function onBeatHit()
  --Thanks bbpanzu You're Cool
   if curBeat % 12 == 0 then
     setProperty('theTree.x', -1900)
     doTweenX('treeTwen', 'theTree', 1900, 0.3, 'linear')
   end
     
   if curBeat == 608 then
     setProperty('sunsetred.visible', true)
     setProperty('streetcool.visible', true)
     setPropertt('car1better.visible', true)
     setProperty('car2better.visible', true)
     setProperyty('sunset.visible', false)
     setProperty('street.visible', false)
     setProperty('car1.visible', false)
     setProperty('car2.visible', false)
     setProperty('rico.visible', false)
     setProperty('kowalski.visible', false)
     setProperty('private.visible', false)
     setProperty('demon.visible', false)
   end
   
   if curBeat == 736 then
     setProperty('sunsetred.visible', false)
     setProperty('streetcool.visible', false)
     setPropertt('car1better.visible', false)
     setProperty('car2better.visible', false)
     setProperyty('sunset.visible', true)
     setProperty('street.visible', true)
     setProperty('car1.visible', true)
     setProperty('car2.visible', true)
     setProperty('rico.visible', true)
     setProperty('kowalski.visible', true)
     setProperty('private.visible', true)
     setProperty('demon.visible', true)
   end
end