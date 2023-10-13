
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 1400;
local yy = 1050;
local xx2 = 2900;
local yy2 = 1050;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()

	makeLuaSprite('cargo walls', 'airship/cargowall', 50, 150);
	scaleLuaSprite('cargo walls', 1.1, 1.1)
	addLuaSprite('cargo walls', false);
	setProperty('cargo walls.alpha', 0)
	makeLuaSprite('cargo', 'airship/cargo', -1300, -650);
	scaleLuaSprite('cargo', 1.6, 1.6)
	addLuaSprite('cargo', false);
	setProperty('cargo.alpha', 0)

end
function onCreatePost()
    setProperty('gf.alpha', 0);
    setProperty('boyfriend.alpha', 0);
    setProperty('dad.alpha', 0);
    setProperty('characterTag.alpha', 0);
end

function onStepHit()
if curStep == 16 then
doTweenAlpha('whitebox', 'white', 1, 0.1, 'linear')
end
if curStep == 1431 then
doTweenAlpha('cargo', 'cargo', 0, 1, 'linear')
doTweenAlpha('cargo wall', 'cargo wall', 0, 1, 'linear')
doTweenAlpha('white', 'dad', 0, 1, 'linear')
doTweenAlpha('black', 'gf', 0, 1, 'linear')
doTweenAlpha('overlay', 'overlay', 0, 1, 'linear')
end
if curStep == 1685 then
doTweenAlpha('blackBox', 'black', 1, 0.1, 'linear')
end
end
function onTweenCompleted(tag)
if tag == 'whitebox' then
doTweenAlpha('whiteboxfade', 'white', 0, 0.1, 'linear')
end
if tag == 'blackBox' then
doTweenAlpha('blackboxfade', 'black', 0, 0.1, 'linear')
setProperty('cargo.alpha', 1)
setProperty('cargo wall.alpha', 1)
setProperty('dad.alpha', 1)
setProperty('gf.alpha', 1)
setProperty('overlay.alpha', 0.7)
setProperty('f.alpha', 0)
setProperty('characterTag.alpha', 0)
end
if tag == 'blackBox2' then
doTweenAlpha('blackboxfade2', 'black', 0, 0.1, 'linear')
end
end

function onSongStart()
doTweenAlpha('cargo', 'cargo', 1, 1, 'linear')
doTweenAlpha('cargo wall', 'cargo wall', 1, 1, 'linear')
doTweenAlpha('white', 'dad', 1, 1, 'linear')
doTweenAlpha('black', 'gf', 1, 1, 'linear')
doTweenAlpha('bf', 'boyfriend', 1, 1, 'linear')
doTweenAlpha('overlay', 'overlay', 0.7, 1, 'linear')
end

function onUpdate()
    	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.65)
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' or getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' or getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' or getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' or getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
        else

            setProperty('defaultCamZoom',0.7)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    if curBeat >= 356 and curBeat < 420 then
		setProperty('defaultCamZoom',1.1)
        xx2 = 2830;
        yy2 = 1150;  
	end
    if curBeat == 420 then
		setProperty('defaultCamZoom',0.45)
        xx2 = 2900;
        yy2 = 1050;  
	end
    if curBeat >= 552 and curBeat < 556 then
		setProperty('defaultCamZoom',1.2)
        xx = 1450;
        yy = 1180;  
	end
    if curBeat == 556 then
        xx = 1500;
        yy = 1050;  
	end
    if curBeat == 848 then
        xx = 2000;
        yy = 1050;  
        xx2 = 2300;
        yy2 = 1050;
	  setProperty('defaultCamZoom',0.8)
	end
    if curBeat == 916 then
        doTweenZoom('defeated', 'camGame', 0.4, 20, 'linear')
    end

end