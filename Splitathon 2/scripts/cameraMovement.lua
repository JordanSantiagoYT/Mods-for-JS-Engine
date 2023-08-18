

--
local Intensity = 20; --[[      CHANGE YOUR INTENSITY CAMERA MOVEMENT HERE       ]]
-- default : 40

--[[

The dont-need-to-change-anything Camera Movement Script !
- An Ammar

---------------------

Turn On Movement VVV
runTimer("camOn", 0)

Turn Off Movement VVV
runTimer("camOff", 0)

]]
 
local followchars = true;
local startCam = false;

local camOffX = 0;
local camOffY = 0;
local oldCamX = 0;
local oldCamY = 0;

local dadPos = {0,0};
local bfPos = {0,0};
local gfPos = {0,0};

function onSongStart()
   findCharCam()

   runTimer("canStartCamera", 0);

end

local oldCam = {0,0};
function onUpdatePost()

   if followchars and startCam then
      anim = getProperty('dad.animation.curAnim.name');
      if mustHitSection and not gfSection then
         anim = getProperty('boyfriend.animation.curAnim.name');
      end
      if gfSection then 
         anim = getProperty('gf.animation.curAnim.name');
      end

      if startsWith(anim, "singLEFT") then
         camOffY = 0;
         camOffX = 0 - Intensity; -- this
      end
      if startsWith(anim, "singRIGHT") then
         camOffY = 0;
         camOffX = Intensity;
      end
      if startsWith(anim, "singUP") then
         camOffX = 0;
         camOffY = 0 - Intensity;
      end
      if startsWith(anim, "singDOWN") then
         camOffX = 0;
         camOffY = Intensity;
      end
      if startsWith(anim, "idle") then
         camOffX = 0;
         camOffY = 0;
      end
   end
   
   if followchars and startCam --[[and (camOffX ~= oldCam[1] or camOffY ~= oldCam[2])]] then
      --debugPrint('halo');
      cameraX = getProperty('camFollow.x');
      cameraY = getProperty('camFollow.y');
      bfX = getProperty('boyfriend.x');
      bfY = getProperty('boyfriend.y');
      dadX = getProperty('dad.x');
      dadY = getProperty('dad.y');
      gfX = getProperty('gf.x');
      gfY = getProperty('gf.y');
      --debugPrint('halo');

      if mustHitSection and not gfSection and (bfPos[1] ~= nil and bfPos[2] ~= nil) then -- bf
         cameraX = getMid(bfX , getProperty('boyfriend.width')) - 100;
         cameraY = getMid(bfY , getProperty('boyfriend.height')) - 100;
         cameraX = cameraX - bfPos[1];
         cameraY = cameraY + bfPos[2];
      elseif not mustHitSection and not gfSection and (dadPos[1] ~= nil and dadPos[2] ~= nil) then
         cameraX = getMid(dadX , getProperty('dad.width')) + 150;
         cameraY = getMid(dadY , getProperty('dad.height')) - 100;
         cameraX = cameraX + dadPos[1];
         cameraY = cameraY + dadPos[2];
      end
      if gfSection and (gfPos[1] ~= nil and gfPos[2] ~= nil) then 
         cameraX = getMid(gfX);
         cameraY = getMid(gfY);
         cameraX = cameraX + gfPos[1];
         cameraY = cameraY + gfPos[2];
      end
      
      setProperty('camFollow.x', cameraX + camOffX);
      setProperty('camFollow.y', cameraY + camOffY);

      --oldCam[1] = camOffX;
      --oldCam[2] = camOffY;
      --debugPrint(getProperty('camFollow.x') .. "  " .. getProperty('camFollow.y')); 
      --[[
      setProperty('camFollow.x', getProperty('camFollow.x') + cameraX);
            setProperty('camFollow.y', getProperty('camFollow.y') + cameraY);
      ]]
      --debugPrint('oooh');
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == "camOff" then
      followchars = false;
   elseif tag == "camOn" then
      followchars = true;
   end
   if tag == "canStartCamera" then
      startCam = true;
   end
end

function getMid(value, size)
   fixSize = 0;

   if size ~= null then
      fixSize = size;
   else
      fixSize = value;
   end
   result = value + (size / 2);


   return result;
end

function startsWith(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function onEvent(name, value1, value2)
	if name == "Change Character" then 
      findCharCam()
   end
end

function findCharCam()

   cameraDad = getProperty('dad.cameraPosition');
   dadPos[1] = cameraDad[1];
   dadPos[2] = cameraDad[2];

   cameraBf = getProperty('boyfriend.cameraPosition');
   bfPos[1] = cameraBf[1];
   bfPos[2] = cameraBf[2];

   cameraGf = getProperty('gf.cameraPosition');
   gfPos[1] = cameraGf[1];
   gfPos[2] = cameraGf[2];

end


