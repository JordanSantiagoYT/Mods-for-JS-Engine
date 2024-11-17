function onCreatePost()
 makeLuaSprite('bg', 'cloudybg', -8000, -5000)
 scaleObject('bg', 10, 10)
 addLuaSprite('bg', false)
 addGlitchEffect('bg', 0.5, 5, 0.015)

 makeLuaSprite('bg2', 'island', -1530, -300)
 scaleObject('bg2', 2, 2)
 addLuaSprite('bg2', true)
 setObjectOrder('boyfriendGroup', 100)
end


function onUpdate(elapsed)   
if curStep == 0 then
    started = true
end

songPos = getSongPosition()

local currentBeat = (songPos/2000)*(curBpm/60)

doTweenY('opponentmove', 'dad', -300 - 350*math.sin((currentBeat+100*100)*math.pi), 0.21)
end