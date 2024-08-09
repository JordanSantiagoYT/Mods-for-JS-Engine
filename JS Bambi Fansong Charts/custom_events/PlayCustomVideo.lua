local VideoStart=false
function onEvent(eventName, value1, value2)
    if eventName=='PlayCustomVideo' then
        StartGeneralVideo(value1,0)
    end
end
function StartGeneralVideo(VideoName,Time)
    addHaxeLibrary('MP4Handler','vlc')
    runHaxeCode([[
        var filepath:String = Paths.video("]]..VideoName..[[");
        var video:MP4Handler = new MP4Handler();
        video.playVideo(filepath);
        setVar('ActualVideo',video);
        video.time=]]..Time..[[;
        video.finishCallback = function()
        {
           game.callOnLuas("onFinishedVideo",["]]..VideoName..[["]);
           return;
        }
    ]])
    VideoStart=true
end
function onFinishedVideo()
    VideoStart=false
end
function onPause()
    if VideoStart then
        return Function_Stop
    end
end