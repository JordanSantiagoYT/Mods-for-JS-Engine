function onCreate() --i wanted to be funny
    addCharacterToList('bf-fg-back', 'boyfriend')
	addCharacterToList('heavenly-p2', 'dad')
end

ogBFPos = {0, 0}
ogDadPosit = {0, 0}
function onCreatePost()
	runHaxeCode("setVar('sceneNum', 1);") -- This background has 2 scenes. If sceneNum is set to 2, use 2nd platform and stuff

	makeLuaSprite('bg2', 'heavenRemake/clouds', -1200, -700);
	addLuaSprite('bg2');
	scaleObject('bg2', 2, 2);
	setScrollFactor('bg2', 0.2, 0.2)
	addWiggleEffect('bg2', 'flag', 0.6,0.06,0.06)

	makeLuaSprite('cc1', 'heavenRemake/Diamond', 200,0)
	setLuaSpriteScrollFactor('cc1', 0.8, 0.8); 
	addLuaSprite('cc1')
	scaleObject('cc1', 0.6,0.6);

	makeLuaSprite('cc3', 'heavenRemake/Diamond', 900,100)
	setLuaSpriteScrollFactor('cc3', 0.5, 0.5); 
	addLuaSprite('cc3')
	scaleObject('cc3', 0.4,0.4);

	makeLuaSprite('cc2', 'heavenRemake/Diamond', 700,100)
	setLuaSpriteScrollFactor('cc2', 1, 1); 
	addLuaSprite('cc2')
	scaleObject('cc2', 1.2,1.2);

	makeLuaSprite('cc4', 'heavenRemake/Diamond', 1600,500)
	setLuaSpriteScrollFactor('cc4', 0.8, 0.8); 
	addLuaSprite('cc4')
	scaleObject('cc4', 0.5,0.5);

	makeLuaSprite('cc5', 'heavenRemake/Diamond', 1200,0)
	setLuaSpriteScrollFactor('cc5', 0.8, 0.8); 
	addLuaSprite('cc5')
	scaleObject('cc5', 0.6,0.6);

	--scene 2 diamonds

	for i=6, 10 do --the update function moves them anyways, so no point in writing the same code for 5 of them
		makeLuaSprite('cc'..i, 'heavenRemake/Diamond', 0,0)
		addLuaSprite('cc'..i)
		setProperty('cc'..i..'.alpha', 0)
	end

	setLuaSpriteScrollFactor('cc6', 0.8, 0.8); 
	scaleObject('cc6', 0.6,0.6);

	setLuaSpriteScrollFactor('cc7', 0.5, 0.5); 
	scaleObject('cc7', 0.4,0.4);

	setLuaSpriteScrollFactor('cc8', 1, 1); 
	scaleObject('cc8', 1.3,1.3);

	setLuaSpriteScrollFactor('cc9', 0.8, 0.8); 
	scaleObject('cc9', 0.5,0.5);

	setLuaSpriteScrollFactor('cc10', 0.8, 0.8); 
	scaleObject('cc10', 0.6,0.6);
	
	makeLuaSprite('plat1','heavenRemake/land_back',200,300)
	addWiggleEffect('plat1', 'flag', 1.4,0.02,0.02)
	addLuaSprite('plat1',false)

	makeLuaSprite('plat2','heavenRemake/land_front',200,300)
	addWiggleEffect('plat2', 'flag', 1.4,0.02,0.02)
	addLuaSprite('plat2',false)
	setProperty('plat2.alpha', 0)

	ogBFPos = {getProperty('boyfriend.x'), getProperty('boyfriend.y')}
	ogDadPosit = {getProperty('dad.x'), getProperty('dad.y')}
end

lastScene = 1
curScene = 1
function onUpdate(elapsed)
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)*(bpm/60)

	setProperty('cc1.x',200 - math.sin(currentBeat*math.pi/8+1.3)*30)
	setProperty('cc1.y',-100 - math.sin(currentBeat*math.pi/8+1.3)*60)
	setProperty('cc1.angle',currentBeat*7)
	setProperty('cc2.x',50 + math.sin(currentBeat*math.pi/8+3.7)*-40)
	setProperty('cc2.y',100 + math.sin(currentBeat*math.pi/8+3.7)*100)
	setProperty('cc2.angle',currentBeat*-5)
	setProperty('cc3.x',900 - math.sin(currentBeat*math.pi/8+2)*-40)
	setProperty('cc3.y',100 + math.sin(currentBeat*math.pi/8+2)*100)
	setProperty('cc3.angle',currentBeat*3)
	setProperty('cc4.x',1600 - math.sin(currentBeat*math.pi/8+4)*-60)
	setProperty('cc4.y',500 + math.sin(currentBeat*math.pi/8+4)*140)
	setProperty('cc4.angle',currentBeat*-4)
	setProperty('cc5.x',1200 - math.sin(currentBeat*math.pi/8+4)*-60)
	setProperty('cc5.y',0 + math.sin(currentBeat*math.pi/8+4)*140)
	setProperty('cc5.angle',currentBeat*5)

	setProperty('cc6.x',-400 - math.sin(currentBeat*math.pi/8+1.3)*30)
	setProperty('cc6.y',200 - math.sin(currentBeat*math.pi/8+1.3)*60)
	setProperty('cc6.angle',currentBeat*7)
	setProperty('cc7.x',900 + math.sin(currentBeat*math.pi/8+3.7)*-40)
	setProperty('cc7.y',200 + math.sin(currentBeat*math.pi/8+3.7)*100)
	setProperty('cc7.angle',currentBeat*-5)
	setProperty('cc8.x',-250 - math.sin(currentBeat*math.pi/8+2)*-40)
	setProperty('cc8.y',300 + math.sin(currentBeat*math.pi/8+2)*100)
	setProperty('cc8.angle',currentBeat*3)
	setProperty('cc9.x',1700 - math.sin(currentBeat*math.pi/8+4)*-60)
	setProperty('cc9.y',500 + math.sin(currentBeat*math.pi/8+4)*140)
	setProperty('cc9.angle',currentBeat*-4)
	setProperty('cc10.x',600 - math.sin(currentBeat*math.pi/8+4)*-60)
	setProperty('cc10.y',0 + math.sin(currentBeat*math.pi/8+4)*140)
	setProperty('cc10.angle',currentBeat*5)

	-- checks if the scene number was changed. if so, changes stuff to match the scene that it's set to.

	curScene = runHaxeCode("return getVar('sceneNum');")
	if curScene ~= lastScene then
		sceneChange(curScene)
		lastScene = curScene
	end
end

function sceneChange(num)
	setProperty('boyfriendCameraOffset[0]', num == 2 and -100 or 0)
	setProperty('boyfriendCameraOffset[1]', num == 2 and 0 or 0)
	triggerEvent('Change Character', 'bf', num == 1 and 'bfMildScared' or 'bf-fg-back')
	triggerEvent('Change Character', 'dad', 'heavenly-p'..num)
	setProperty('dad.danceEveryNumBeats', num == 2 and 1 or 2)
	if num == 2 then
		setProperty('boyfriend.x', ogBFPos[1] + 600)
		setProperty('boyfriend.y', ogBFPos[2] + 300)
		setProperty('dad.x', ogDadPosit[1] + 500)
		setProperty('dad.y', ogDadPosit[2] + 100)
	end
	setProperty('bg2.angle', num == 2 and 20 or 0)
	setProperty('bg2.x', num == 2 and -1600 or -1200)
	setProperty('bg2.y', num == 2 and -900 or -700)
	for i=1,5 do
		setProperty('cc'..i..'.alpha', num == 2 and 0 or 1)
		setProperty('cc'..(i+5)..'.alpha', num == 2 and 1 or 0)
	end
	setProperty('plat1.alpha', num == 1 and 1 or 0)
	setProperty('plat2.alpha', num == 2 and 1 or 0)
	cameraSetTarget(mustHitSection and 'bf' or 'dad')
end