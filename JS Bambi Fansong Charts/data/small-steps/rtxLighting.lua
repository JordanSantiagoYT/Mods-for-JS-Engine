
local useEditor = false

local sliders = 
{
    --name     val  x   y   wid  hei  min  max  dragging  color
    {'overlayR', 0, 50, 50, 200, 10,  0,   1,   false, "0xFFFF0000"},
    {'overlayG', 0, 50, 100, 200, 10,  0,   1,   false , "0xFF00FF00"},
    {'overlayB', 0, 50, 150, 200, 10,  0,   1,   false, "0xFF0000FF"},
    {'overlayA', 0, 50, 200, 200, 10,  0,   1,   false, "0xFFAAAAAA"},

    {'satinR', 0, 300, 50, 200, 10,  0,   1,   false, "0xFFFF0000"},
    {'satinG', 0, 300, 100, 200, 10,  0,   1,   false , "0xFF00FF00"},
    {'satinB', 0, 300, 150, 200, 10,  0,   1,   false, "0xFF0000FF"},
    {'satinA', 0, 300, 200, 200, 10,  0,   1,   false, "0xFFAAAAAA"},

    {'innerR', 0, 550, 50, 200, 10,  0,   1,   false, "0xFFFF0000"},
    {'innerG', 0, 550, 100, 200, 10,  0,   1,   false , "0xFF00FF00"},
    {'innerB', 0, 550, 150, 200, 10,  0,   1,   false, "0xFF0000FF"},
    {'innerA', 0, 550, 200, 200, 10,  0,   1,   false, "0xFFAAAAAA"},


    {'innerAngle', 0, 800, 50, 200, 10,  0,   360,   false, "0xFFAAAAAA"},
    {'innerDistance', 20, 800, 100, 200, 10,  0,   50,   false, "0xFFCCCCCC"}
}

function onCreatePost()
    initLuaShader('RTXLighting')
    setSpriteShader('boyfriend', 'RTXLighting')
    setSpriteShader('dad', 'RTXLighting')
    setSpriteShader('gf', 'RTXLighting')

    setShaderFloatArray('boyfriend', 'overlayColor', {0.0, 0.0, 0.0, 0.0})
    setShaderFloatArray('boyfriend', 'satinColor', {0.0, 0.0, 0.0, 0.0})
    setShaderFloatArray('boyfriend', 'innerShadowColor', {0.0, 0.0, 0.0, 0.0})
    setShaderFloat('boyfriend', 'innerShadowAngle', 0.0)
    setShaderFloat('boyfriend', 'innerShadowDistance', 20)

    local didSetData = false

    local eventsLength = getProperty('eventNotes.length')
    for i = 0,eventsLength-1 do 
        local eventName = getPropertyFromGroup('eventNotes', i, 'event')
        if eventName == 'Open RTX Editor' then
            useEditor = true
        elseif eventName == "Set RTX Data" then
            if not didSetData then 
                didSetData = true --only set once, should be first
                setRTXData(getPropertyFromGroup('eventNotes', i, 'value1'))
            end
        end
    end

    

    if useEditor then 
      createEditorHUD()
      setProperty('cpuControlled', true)
      setProperty('camHUD.visible', false)
      --luaDebugMode = true

      --setProperty('lime.system.Clipboard.text', "hi")
        addHaxeLibrary('Clipboard', 'lime.system')
        --addHaxeLibrary('Clipboard', 'flash.desktop')
        --addHaxeLibrary('ClipboardFormats', 'flash.desktop')
        --runHaxeCode("Clipboard.text = 'test';")
    end 
end

function onEvent(tag, val1, val2)
    if tag == "Set RTX Data" then
        setRTXData(val1)
    elseif tag == 'Change Character' then
        setSpriteShader('boyfriend', 'RTXLighting')
        setSpriteShader('dad', 'RTXLighting')
        setSpriteShader('gf', 'RTXLighting')
        updateShader()
    end
end

function onEndSong()

  if useEditor then 
      setProperty('endingSong', false)
      return Function_Stop;  --dont end when using editor
  end

  return Function_Continue;
end

--string split
function split(s, delimiter)
  result = {};
  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
      table.insert(result, match);
  end
  return result;
end
---

function setRTXData(dataStr)
    local data = split(dataStr, ",")

    for i = 1, #data do
        sliders[i][2] = tonumber(data[i]) --update sliders to update the data
    end
    updateShader()
end


local mouseWidth = 20
local sliderWidth = 10

function createEditorHUD()

    for i = 1, #sliders do 

        local data = sliders[i]

        makeLuaSprite(data[1].."back", "", data[3], data[4])
        makeGraphic(data[1].."back", data[5], data[6], data[10])
        setObjectCamera(data[1].."back", 'other')
        addLuaSprite(data[1].."back", true)


        makeLuaSprite(data[1].."slider", "", data[3], data[4]-(data[6]*0.5))
        makeGraphic(data[1].."slider", sliderWidth, data[6]*2, '0xFFFFFFFF')
        setObjectCamera(data[1].."slider", 'other')
        addLuaSprite(data[1].."slider", true)

        makeLuaText(data[1]..'text', "test", data[5], data[3], data[4]-20)
        setObjectCamera(data[1].."text", 'other')
        addLuaText(data[1]..'text')
    end

    makeLuaText("CopyText", "Click Here to copy data to clipboard", 0, 50, 650)
    setObjectCamera("CopyText", 'other')
    addLuaText("CopyText")

    makeLuaSprite("mouse", "", 0, 0)
    makeGraphic("mouse", mouseWidth, mouseWidth, '0xFFAAAAAA')
    setObjectCamera("mouse", 'other')
    addLuaSprite("mouse", true)


end

--helper funcs-------
function pointOverlaps(obj, mouseX, mouseY)

  local x = getProperty(obj..".x")
  local y = getProperty(obj..".y")
  local w = getProperty(obj..".width")
  local h = getProperty(obj..".height")

  return (mouseX+mouseWidth > x) and (mouseX < x + w) and (mouseY+mouseWidth > y) and (mouseY < y + h);

end


function remapToRange(value, start1, stop1, start2, stop2)
    return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end
-------------

function onUpdate(elapsed)
    if useEditor then 
      updateEditor(elapsed)
    end
end

function updateEditor(elapsed)

  setProperty('camHUD.zoom', 1)

    local mouseX = getMouseX()
    local mouseY = getMouseY()
    local justClicked = mouseClicked("")
    local justReleased = mouseReleased("")
    local mousePressed = mousePressed("")

    setProperty('mouse.x', mouseX)
    setProperty('mouse.y', mouseY)

    for i = 1, #sliders do --update sliders

        local data = sliders[i]

        setProperty(data[1].."slider.x", remapToRange(data[2], data[7], data[8], data[3], data[3]+data[5])) --set bar pos from value


        local overlapsSlider = pointOverlaps(data[1].."slider", mouseX, mouseY)
        local overlapsBack = pointOverlaps(data[1].."back", mouseX, mouseY)

        if overlapsSlider or overlapsBack then 
          setProperty(data[1].."slider.color", getColorFromHex("AAAAAA"))
      else 
          setProperty(data[1].."slider.color", getColorFromHex("FFFFFF"))
      end

        if (overlapsSlider or overlapsBack) and justClicked then
            sliders[i][9] = true
        elseif justReleased then 
          sliders[i][9] = false
        end


        local snapToMouse = sliders[i][9]

        if snapToMouse then 

            local newPos = mouseX
            if mouseX <= data[3] then --bound to range
              newPos = data[3]
            elseif mouseX >= data[3]+data[5] then 
              newPos = data[3]+data[5]
            end
            
            setProperty(data[1].."slider.x", newPos)

            data[2] = remapToRange(newPos, data[3], data[3]+data[5], data[7], data[8]) --update value
            
        end

        setTextString(data[1]..'text', data[1]..": "..(math.floor(data[2]*100)/100))
    end

    if pointOverlaps("CopyText", mouseX, mouseY) then 
      setTextColor("CopyText", "0xFFAAAAAA")

        if justClicked then 
            local dataStr = ""

            for i = 1, #sliders do --stringify data

                dataStr = dataStr..sliders[i][2]
                if i < #sliders then 
                    dataStr = dataStr..","
                end
            end

            runHaxeCode("Clipboard.text = '"..dataStr.."';")

            playSound("confirmMenu")
        end
    else 
      setTextColor("CopyText", "0xFFFFFFFF")
    end


    updateShader()

end

function updateShader()--update shader from slider stored values
  setShaderFloatArray('boyfriend', 'overlayColor', {sliders[1][2],sliders[2][2],sliders[3][2],sliders[4][2]})
  setShaderFloatArray('boyfriend', 'satinColor', {sliders[5][2],sliders[6][2],sliders[7][2],sliders[8][2]})
  setShaderFloatArray('boyfriend', 'innerShadowColor', {sliders[9][2],sliders[10][2],sliders[11][2],sliders[12][2]})
  setShaderFloat('boyfriend', 'innerShadowAngle', sliders[13][2]*(math.pi/180))
  setShaderFloat('boyfriend', 'innerShadowDistance', sliders[14][2])
end
