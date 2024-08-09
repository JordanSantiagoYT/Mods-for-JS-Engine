function onEvent(n,v1,v2)


	if n == 'Flash Camera' then

	   makeLuaSprite('flashBang', '', 0, 0);
        makeGraphic('flashBang',1280,720,'ffffff')
	      addLuaSprite('flashBang', true);
	      setLuaSpriteScrollFactor('flashBang',0,0)
	      setProperty('flashBang.scale.x',2)
	      setProperty('flashBang.scale.y',2)
	      setProperty('flashBang.alpha',0)
		setProperty('flashBang.alpha',1)
		doTweenAlpha('flashingBye','flashBang',0,v1,'linear')
	end



end