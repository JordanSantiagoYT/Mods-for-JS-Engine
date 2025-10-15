--[[ made by beihu(b站一北狐丶逐梦) 
    bilbil: https://b23.tv/gxqO0GH
    youtube: https://www.youtube.com/@beihu235
    
    download: https://youtu.be/pD_a82jTJgY
    
    sorry my engine is too bad
    
    it takes me 4 mouth finish this I've been thinking data logic about it, actually.
    maybe you can think logic is too easy,but find it is a tough process
    
    it only use a little memory and CPU utility so you dont need worried about it 
    
    notice: if your sprite bottom have blank,you need fix Y location by yourself

    credit if you are using this for a public mod!
    If you use it in your video,l hope you can give a link to this video,l want more people can use it
  ]]
  
function onCreatePost()
        
    BFAlpha = 0.35
    GFAlpha = 0.35
    DADAlpha = 0.35

    checkCharacter() --about Character Y Fix
    checkSong() --about show     

--------------------------------------------------

    if showBF then

        bfimage = getProperty('boyfriend.imageFile')
        bfframe = getProperty('boyfriend.animation.frameName')
        bfx = getProperty('boyfriend.x')

        bfscaleX = getProperty('boyfriend.scale.x')
        bfscaleY = getProperty('boyfriend.scale.y')
        bfoffsetX = getProperty('boyfriend.offset.x')
        bfoffsetY = getProperty('boyfriend.offset.y')
        bfflipX = getProperty('boyfriend.flipX')
        
        setObjectOrder('bfPhantom',getObjectOrder('boyfriendGroup')-1)
        makeAnimatedLuaSprite('bfPhantom',bfimage,bfx,0)
        addLuaSprite('bfPhantom',false)
        setProperty('bfPhantom.offset.x',bfoffsetX)
        setProperty('bfPhantom.offset.y',bfoffsetY)
        setProperty('bfPhantom.scale.x',bfscaleX)
        setProperty('bfPhantom.scale.y',bfscaleY)
        setProperty('bfPhantom.alpha',BFAlpha)
        setProperty('bfPhantom.flipX', bfflipX)
        setProperty('bfPhantom.flipY', true)
        setProperty('bfPhantom.y',getProperty('boyfriend.y') + getProperty('boyfriend.frameHeight')*getProperty('boyfriend.scale.y') * 2 - bfoffsetY * 2 + BFYFix)
    end

-----------------------------boyfriend sprite---------------------

    if showDAD then
        dadimage = getProperty('dad.imageFile')
        dadframe = getProperty('dad.animation.frameName')
        dadx = getProperty('dad.x')

        dadscaleX = getProperty('dad.scale.x')
        dadscaleY = getProperty('dad.scale.y')
        dadoffsetX = getProperty('dad.offset.x')
        dadoffsetY = getProperty('dad.offset.y')
        dadflipX = getProperty('dad.flipX')

        setObjectOrder('dadPhantom',getObjectOrder('dadGroup')-1)
        makeAnimatedLuaSprite('dadPhantom',dadimage,dadx,0)
        addLuaSprite('dadPhantom',false)
        setProperty('dadPhantom.offset.x',dadoffsetX)
        setProperty('dadPhantom.offset.y',dadoffsetY)
        setProperty('dadPhantom.scale.x',dadscaleX)
        setProperty('dadPhantom.scale.y',dadscaleY)
        setProperty('dadPhantom.alpha',DADAlpha)
        setProperty('dadPhantom.flipY', true);
        setProperty('dadPhantom.flipX', dadflipX)
        setProperty('dadPhantom.y',getProperty('dad.y') + getProperty('dad.frameHeight') * getProperty('dad.scale.y') * 2 - dadoffsetY * 2 + DADYFix)
    end
    
--------------------------dad sprite--------------------------

    if showGF and getProperty('gf.visible') == true then
        gfimage = getProperty('gf.imageFile')
        gfframe = getProperty('gf.animation.frameName')
        gfx = getProperty('gf.x')

        gfscaleX = getProperty('gf.scale.x')
        gfscaleY = getProperty('gf.scale.y')
        gfoffsetX = getProperty('gf.offset.x')
        gfoffsetY = getProperty('gf.offset.y')
        gfflipX = getProperty('gf.flipX')
        
        setObjectOrder('gfPhantom',getObjectOrder('gfGroup')-1)
        makeAnimatedLuaSprite('gfPhantom',gfimage,gfx,0)
        addLuaSprite('gfPhantom',false)
        setProperty('gfPhantom.offset.x',gfoffsetX)
        setProperty('gfPhantom.offset.y',gfoffsetY)
        setProperty('gfPhantom.scale.x',gfscaleX)
        setProperty('gfPhantom.scale.y',gfscaleY)
        setProperty('gfPhantom.alpha',GFAlpha)
        setProperty('gfPhantom.flipY', true);
        setProperty('gfPhantom.y',getProperty('gf.y') + getProperty('gf.frameHeight') * getProperty('gf.scale.y') * 2 - gfoffsetY * 2 + GFYFix)
    end
    
--------------------------gf sprite--------------------------

end


function onUpdate()


    bfframe = getProperty('boyfriend.animation.frameName')
    addAnimationByPrefix('bfPhantom','b',bfframe,1,true)
    objectPlayAnimation("bfPhantom","b",true)
    bfoffsetX = getProperty('boyfriend.offset.x')
    bfoffsetY = getProperty('boyfriend.offset.y')
    setProperty('bfPhantom.offset.x',bfoffsetX)
    setProperty('bfPhantom.offset.y',getProperty('boyfriend.frameHeight')*getProperty('boyfriend.scale.y')-bfoffsetY)

-----------------------------boyfriend playanim---------------

    dadframe = getProperty('dad.animation.frameName')
    addAnimationByPrefix('dadPhantom','d',dadframe,1,true)
    objectPlayAnimation("dadPhantom","d",true)
    dadoffsetX = getProperty('dad.offset.x')
    dadoffsetY = getProperty('dad.offset.y')
    setProperty('dadPhantom.offset.x',dadoffsetX)
    setProperty('dadPhantom.offset.y',getProperty('dad.frameHeight')*getProperty('dad.scale.y')-dadoffsetY)

-----------------------------dad playanim---------------

    gfframe = getProperty('gf.animation.frameName')
    addAnimationByPrefix('gfPhantom','g',gfframe,1,true)
    objectPlayAnimation("gfPhantom","g",true)
    gfoffsetX = getProperty('gf.offset.x')
    gfoffsetY = getProperty('gf.offset.y')
    setProperty('gfPhantom.offset.x',gfoffsetX)
    setProperty('gfPhantom.offset.y',gfoffsetY)
    setProperty('gfPhantom.offset.x',gfoffsetX)
    setProperty('gfPhantom.offset.y',getProperty('gf.frameHeight')*getProperty('gf.scale.y')-gfoffsetY)

-----------------------------gf playanim---------------

end

function onEvent(name,value1,value2)
    if name == "Change Character" then
    
    checkCharacter()
    
        if value1 == "BF" or value1 == "bf" then
            bfimage = getProperty('boyfriend.imageFile')
            bfframe = getProperty('boyfriend.animation.frameName')
            bfx = getProperty('boyfriend.x')

            bfscaleX = getProperty('boyfriend.scale.x')
            bfscaleY = getProperty('boyfriend.scale.y')
            bfoffsetX = getProperty('boyfriend.offset.x')
            bfoffsetY = getProperty('boyfriend.offset.y')
            bfflipX = getProperty('boyfriend.flipX')
            
            setObjectOrder('bfPhantom',getObjectOrder('boyfriendGroup')-1)
            makeAnimatedLuaSprite('bfPhantom',bfimage,bfx,0)
            addLuaSprite('bfPhantom',false)
            setProperty('bfPhantom.offset.x',bfoffsetX)
            setProperty('bfPhantom.offset.y',bfoffsetY)
            setProperty('bfPhantom.scale.x',bfscaleX)
            setProperty('bfPhantom.scale.y',bfscaleY)
            setProperty('bfPhantom.alpha',BFAlpha)
            setProperty('bfPhantom.flipX', bfflipX)
            setProperty('bfPhantom.flipY', true)
            setProperty('bfPhantom.y',getProperty('boyfriend.y') + getProperty('boyfriend.frameHeight')*getProperty('boyfriend.scale.y') * 2 - bfoffsetY * 2 + BFYFix)
        end
        
        if value1 == "GF" or value1 == "gf" then
            gfimage = getProperty('gf.imageFile')
            gfframe = getProperty('gf.animation.frameName')
            gfx = getProperty('gf.x')

            gfscaleX = getProperty('gf.scale.x')
            gfscaleY = getProperty('gf.scale.y')
            gfoffsetX = getProperty('gf.offset.x')
            gfoffsetY = getProperty('gf.offset.y')
            gfflipX = getProperty('gf.flipX')
            
            setObjectOrder('gfPhantom',getObjectOrder('gfGroup')-1)
            makeAnimatedLuaSprite('gfPhantom',gfimage,gfx,0)
            addLuaSprite('gfPhantom',false)
            setProperty('gfPhantom.offset.x',gfoffsetX)
            setProperty('gfPhantom.offset.y',gfoffsetY)
            setProperty('gfPhantom.scale.x',gfscaleX)
            setProperty('gfPhantom.scale.y',gfscaleY)
            setProperty('gfPhantom.alpha',GFAlpha)
            setProperty('gfPhantom.flipX', gfflipX)
            setProperty('gfPhantom.flipY', true)
            setProperty('gfPhantom.y',getProperty('gf.y') + getProperty('gf.frameHeight')*getProperty('gf.scale.y') * 2 - gfoffsetY * 2 + gfYFix)
        end

        if value1 == "Dad" or value1 == "dad" then
            dadimage = getProperty('dad.imageFile')
            dadframe = getProperty('dad.animation.frameName')
            dadx = getProperty('dad.x')

            dadscaleX = getProperty('dad.scale.x')
            dadscaleY = getProperty('dad.scale.y')
            dadoffsetX = getProperty('dad.offset.x')
            dadoffsetY = getProperty('dad.offset.y')
            dadflipX = getProperty('dad.flipX')

            setObjectOrder('dadPhantom',getObjectOrder('dadGroup')-1)
            makeAnimatedLuaSprite('dadPhantom',dadimage,dadx,0)
            addLuaSprite('dadPhantom',false)
            setProperty('dadPhantom.offset.x',dadoffsetX)
            setProperty('dadPhantom.offset.y',dadoffsetY)
            setProperty('dadPhantom.scale.x',dadscaleX)
            setProperty('dadPhantom.scale.y',dadscaleY)
            setProperty('dadPhantom.alpha',DADAlpha)
            setProperty('dadPhantom.flipY', true);
            setProperty('dadPhantom.flipX', dadflipX)
            setProperty('dadPhantom.y',getProperty('dad.y') + getProperty('dad.frameHeight') * getProperty('dad.scale.y') * 2 - dadoffsetY * 2 + DADYFix)
        end
    end
end

function checkCharacter()

    -----------------------

    if boyfriendName =='YourBFName' then
        BFYFix = 0
    elseif boyfriendName =='YourBFName2' then
        BFYFix = 0
    else
        BFYFix = 0    
    end
    
    ------------boyfriend-----------
    
    if dadName == 'YourDadName' then
        DADYFix = 0
    elseif dadName == 'YourDadName2' then
        DADYFix = 0
    else
        DADYFix = 0    
    end
    
    ------------dad-----------
    
    if gfName == 'YourGFName' then
        GFYFix = 0
    elseif gfName == 'YourGFName2' then
        GFYFix = 0
    else
        GFYFix = 0    
    end
    
    ------------gf-----------
    
end

function checkSong()

    if songName == 'YourSongName' then
        showBF = false
        showDAD = false
        showGF = false
    elseif songName == 'YourSongName2' then
        showBF = true
        showDAD = true
        showGF = true    
    else
        showBF = true
        showDAD = true
        showGF = true    
    end    
    
end

