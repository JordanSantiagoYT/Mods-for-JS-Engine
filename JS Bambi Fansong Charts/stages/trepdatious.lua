--ps, this is an edited version of the Trepidatious stage from Nael's Ultimate Spam Mod, download it here: https://gamejolt.com/games/NUSM/886661
local dahBpm = 272

function onCreatePost()
	makeLuaSprite('shader','yellowy',-1100,-675)
	addLuaSprite('shader')
	runTimer("e", 0.3, 1)
	scaleObject("shader", 8.7, 5)

    	initLuaShader('trepidatious')
    	setSpriteShader('shader', 'trepidatious')

	addChromaticAbberationEffect('camGame', 0.003, 0.003)
	addChromaticAbberationEffect('camHUD', 0.003, 0.003)
	addChromaticAbberationEffect('camOther', 0.003, 0.003)

	makeAnimatedLuaSprite("chahhhhhh", "chahhhhhh", -1150, -900)
	addAnimationByPrefix("chahhhhhh", "chahhhhhh", "chahhhhhh", 24, true)
	addLuaSprite("chahhhhhh")
	setProperty("chahhhhhh.alpha", 0)

	debugPrint("I do not know who made the spritesheet, leave me alone.")
	debugPrint("yeah whatever nael said i didnt make the spritesheet - Jordan Santiago")
end

function onStepHit()
	if curStep == 512 then
		setProperty("chahhhhhh.alpha", 1)
		scaleObject("chahhhhhh", 2.3, 2.3)
	end
	if curStep == 2048 then
		dahBpm = 104448
	end
	if curStep == 2560 then
		dahBpm = 272
	end
	if curStep == 3712 then
		dahBpm = 104448
	end
	if curStep == 4224 then
		dahBpm = 417792
	end
	if curStep == 4736 then
		removeLuaSprite("chahhhhhh")
		dahBpm = 272
	end
end

function onTweenCompleted(tag)
	removeLuaSprite(tag)
end

function onUpdate(elapsed)
	triggerEvent("Camera Follow Pos", 0, 0)
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/80)
	if luaSpriteExists("chahhhhhh") then
		doTweenY(dadTweenY, 'chahhhhhh', -900-75*math.sin((currentBeat*0.2)*math.pi),0.001)
		if dahBpm == 272 then
			setProperty("chahhhhhh.x", -990)
		else
			doTweenX(math.random(100000, 100000000), 'chahhhhhh', -980-100*math.sin((currentBeat*((dahBpm/80000)))*math.pi),0.001)
		end
	end
	setShaderFloat('shader', 'iTime', songPos/600)
end