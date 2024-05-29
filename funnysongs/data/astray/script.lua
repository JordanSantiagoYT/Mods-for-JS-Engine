


function onCreatePost()
    setProperty('timeBarBG.visible', false)
  
     setProperty('timeBar.visible', false)
  end



    function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat2 = (songPos/1000)*(curBpm/50)
    local currentBeat = (songPos/5000)*(curBpm/75)
    function onMoveCamera(focus)
        if focus == 'boyfriend' then
            -- called when the camera focus on boyfriend
        elseif focus == 'dad' then
            setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
        end
    end

    setProperty('camHUD.angle',0 - 5 * math.cos((currentBeat2*0.1)*math.pi) )
    setProperty('camHUD.y',10 - 40 * math.cos((currentBeat2*0.1)*math.pi) )
    setProperty('camHUD.x',5 - 20 * math.sin((currentBeat2*0.1)*math.pi) )
    
    setProperty('camGame.angle',0 - 5 * math.cos((currentBeat2*0.1)*math.pi) )
    setProperty('camGame.y',10 - 40 * math.cos((currentBeat2*0.1)*math.pi) )
    setProperty('camGame.x',5 - 20 * math.sin((currentBeat2*0.1)*math.pi) )
    
    

    end
    