function onCreate()
	makeLuaSprite('bg', 'moribundBG', -3000, -1600);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 4, 4);
	addLuaSprite('bg', false);

	makeLuaSprite('nipplePartyGuy', 'iphathi/it is me nipple party guy', 0, -650);
	setLuaSpriteScrollFactor('nipplePartyGuy', 0, 0);
	scaleObject('nipplePartyGuy', 2, 2);
	setProperty('nipplePartyGuy.alpha', 0)
	addLuaSprite('nipplePartyGuy', false);

	makeLuaSprite('plat', 'iphathi/plat', 1050, 650);
	setScrollFactor('plat', 1, 1);
	scaleObject('plat', 0.9, 0.9);
	addLuaSprite('plat', false)

	initLuaShader("SickGalaxy")
	setSpriteShader("bg", "SickGalaxy")
end

function onCreatePost()
	doTweenColor('bfColor', 'boyfriend', 'e2bfff' , 0.1, 'linear');
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'iTime', getSongPosition()/500)
end

function onEvent(name,value1,value2)
    if name == "Change Character" then
	doTweenColor('bfColor', 'boyfriend', 'e2bfff' , 0.001, 'linear');
    end
end