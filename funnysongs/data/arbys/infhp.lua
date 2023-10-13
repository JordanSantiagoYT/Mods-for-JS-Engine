extra = 1

function onUpdate()
if(getProperty('health') > 2) then
  setProperty('health', 3)
end
end

function onGameOver()
    if extra > 1 then
        setProperty('health', 2)
        extra = extra - 1
        return Function_Stop
    end
end

function onUpdatePost()
    if extra > 1 then
        setProperty('iconP1.animation.curAnim.curFrame', 0)
        setProperty('iconP2.animation.curAnim.curFrame', 1)
    end
    setTextString('bars', 'hp bars: '..extra)
end

function onCreate()
setProperty('healthBar.scale.x', 2)
setProperty('healthBarBG.scale.x', 2)
setProperty('maxHealth', 3)
    makeLuaText('bars', "hp bars: 1", 600, 330, 150);
	setObjectCamera("bars", 'camHUD');
    setTextAlignment('bars', 'center');
	addLuaText('bars', true);
end