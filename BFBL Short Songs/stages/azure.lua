function onCreate()
	makeLuaSprite('azure', 'azureBG/azure', -1800, -1300);
	setScrollFactor('azure', 0.2, 0.2);
	scaleObject('azure', 3, 3);
	addLuaSprite('azure', false);
	addGlitchEffect('azure', 3, 60)
        setProperty('azure.antialiasing',false)
	
	makeLuaSprite('ThanosGround', 'azureBG/ThanosGround', 900, 700);
	setLuaSpriteScrollFactor('ThanosGround', 1, 1);
	scaleObject('ThanosGround', 0.6, 0.6);
	addLuaSprite('ThanosGround', false);
end