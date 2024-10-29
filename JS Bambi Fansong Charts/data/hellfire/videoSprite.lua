--bbpanzu
--[[

you could call it like

addLuaScript('videoSprite')

and it'll pop up right then and there




]]

function onCreate()

	makeLuaSprite('videoSprite','',335,187)
	addLuaSprite('videoSprite')
    setProperty('gfGroup.visible', false);
    	scaleObject('videoSprite', 2.4, 2.4);
	setObjectOrder('videoSprite', 1);
        setScrollFactor('videoSprite', 0, 0);
	setObjectCamera('videoSprite', 'camGame');
	-- makes the video sprite

	addHaxeLibrary('MP4Handler','vlc')
	addHaxeLibrary('Event','openfl.events')
	--add needed haxe libraries for video and openfl events

end

function onSongStart()
	--run the main haxe code
	runHaxeCode([[

		var filepath = Paths.video('HELLFIRE');
		//get the video path
		
		var video = new MP4Handler();
		//create the video object

		video.playVideo(filepath);
		//play the video file

		video.visible = false;
		//make the video object overlay invisible

		setVar('video',video);
		//set global variable

		FlxG.stage.removeEventListener('enterFrame', video.update); 
		//removes the native update event the video has (disables skipping pressing enter)
	]])
end

function onUpdatePost()


	--run the main haxe code
	runHaxeCode([[
		var video = getVar('video');
		//get video object variable

		game.getLuaObject('videoSprite').loadGraphic(video.bitmapData);
		//set video sprite's graphic as the video's bitmap data

		video.volume = 0 + 0;
		//set video volume as the game's volume (plus 0.4 idk psych has that for some reason)
		
		if(game.paused)video.pause();
		//pause video if the game is paused

	]])

end


function onResume()

	--run the main haxe code
	runHaxeCode([[
		var video = getVar('video');
		//get video object variable

		video.resume();
		//resume video when game is resumed
	]])

end