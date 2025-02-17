useFromText = false --set to true for subtitles to be read from data/song/subs.txt
function string:split(s) return stringSplit(self, s) end
function onCreate() --load the shit
    addHaxeLibrary 'Type'
    addHaxeLibrary('FlxTypeText', 'flixel.addons.text')
    addHaxeLibrary 'ClientPrefs'
    fixRH()
    luaDebugMode = true
	subText = subs
    if useFromText then
        subs = getTextFromFile('data/'..songPath..'/subs.txt')
        if not subs then error 'Subtitles not found!' end
        subs = subs:split '\n'
        subs.index = 0
    end
end
function onEvent(n, sub, v2)
    if n == 'dnbsubs' then
        local size, typespeed, showtime = unpack(v2:split ', ') --unpack <33333
        sub = sub:gsub(',/', ',') --if you are calling from an event
        size = tonumber(size) or 36
        typespeed = tonumber(typespeed) or 0.02
        showtime = tonumber(showtime) or 1
        if useFromText then
            subs.index = subs.index + 1
            sub = subs[subs.index]
        end
        runHaxeCode([[
            var sub = new FlxTypeText(0, 0, FlxG.width, sub, 36);
            sub.y = (FlxG.height / 2) - 200 * (ClientPrefs.showcaseMode ? 0.7 : 1);
            sub.setFormat(Paths.font("comic.ttf"), size, 0xFFFFFF, 'center', Type.resolveEnum('flixel.text.FlxTextBorderStyle').OUTLINE, 0xFF000000);
            sub.antialiasing = ClientPrefs.globalAntialiasing;
            sub.borderSize = 2;
            sub.cameras = [game.camHUD];
            sub.start(typespeed / game.playbackRate, false, false, [], () -> {
                game.modchartTimers.set(sub + 'timer', new FlxTimer().start(showtime / game.playbackRate, _ -> {
                    game.modchartTweens.set(sub + ' tween', FlxTween.tween(sub, {alpha: 0}, 0.5 / game.playbackRate, {onComplete: _ -> {
                        game.remove(sub);
                        sub.destroy();
                    }}));
                }));
            });
            sub.screenCenter(0x01);
            game.add(sub);
        ]], {sub = sub, size = size, typespeed = typespeed, showtime = showtime})
    end
end
function fixRH()
    local rh = runHaxeCode
    rh("setVar('luaVarHolder', null);")
    runHaxeCode = function(code, vars)
    if not vars then
        return rh(code)
    else
        setProperty('luaVarHolder', vars)
        local stringVars = {}
        for k,v in pairs(vars) do
            table.insert(stringVars, "var "..k.." = getVar('luaVarHolder')."..k..";")
        end
        rh(table.concat(stringVars, '\n')..'\n'..code)
        setProperty('luaVarHolder', nil)
    end
    end
end