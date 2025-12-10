--bbpanzu
--[[

you could call it like

addLuaScript('videoSprite')

and it'll pop up right then and there




]]

function onCreate()
	luaDebugMode = true;
	runHaxeCode('game.startVideo("HELLFIRE", "videos", null, true, false, false, false);')
end

function onSongStart()
	--run the main haxe code
	runHaxeCode([[
		game.videoCutscene.videoSprite.play();
		game.videoCutscene.cameras = [game.camGame];
		game.videoCutscene.videoSprite.volume = 0;
		game.videoCutscene.scrollFactor.set(0, 0);
	]])
end