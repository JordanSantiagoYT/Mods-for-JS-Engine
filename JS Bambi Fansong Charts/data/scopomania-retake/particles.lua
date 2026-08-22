local maxParticles = 200
local particles = {}
local particlesEnabled = false

function onCreatePost()
    for i = 1, maxParticles do
        local tag = 'square_' .. i
        local scale = math.random(4, 20)
        makeLuaSprite(tag, '', math.random(0, 1280), math.random(-50, 720))
        makeGraphic(tag, scale, scale, 'FFFFFF')
        setProperty(tag..'.alpha', 0)
        addLuaSprite(tag, true)

        setObjectCamera(tag, 'camGame')
        
        particles[i] = {
            tag = tag,
            x = getProperty(tag .. '.x'),
            y = getProperty(tag .. '.y'),
            speedY = math.random(120, 360),
            speedX = math.random(-120, 120),
            baseAlpha = math.random(60, 100) / 100
        }
    end
end

function onStepHit()
	if curStep == 1288 then
		particleTrigger(true, 'FF0000')
	end
	if curStep == 1792 then
		particleTrigger(false)
	end
end

function particleTrigger(enabled, color)
        if enabled then
            particlesEnabled = true
            for i = 1, maxParticles do
                setProperty(particles[i].tag..'.alpha', particles[i].baseAlpha)
            end
        else
            particlesEnabled = false
            for i = 1, maxParticles do
                setProperty(particles[i].tag..'.alpha', 0)
            end
        end
        
        if color == '' or color == nil then color = 'FFFFFF' end

        for i = 1, maxParticles do
            setProperty(particles[i].tag .. '.color', getColorFromHex(color))
        end
end

function onUpdate(elapsed)
    if particlesEnabled then
        for i = 1, maxParticles do
            local p = particles[i]
            
            p.y = p.y - (p.speedY * elapsed * getProperty('playbackRate'))
            p.x = p.x + (p.speedX * elapsed * getProperty('playbackRate'))
            
            if p.y < -600 then
                p.y = math.random(1150, 1340)
                p.x = math.random(-2560, 1280)
            end
            
            setProperty(p.tag .. '.x', p.x)
            setProperty(p.tag .. '.y', p.y)
        end
    end
end